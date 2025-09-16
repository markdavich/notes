# C# 10

## Deconstruction and Property Patterns
> Deconstruction makes it possible to map properties of an object to a set of  
> scoped variables.

### Record Deconstruction with Positional Parameters
```cs
// Define a record with positional parameters
public record class Address(
    string Street,
    string City
);

// Instantiate the record
Address address = new("Main", "Boise");

// Deconstruct the address into locally scoped variables, street and city
// below are different ways to do this:
var (street, city) = address;
var (a, b) = address;

// Independently declared variables and anonymous deconstruction
string c, d;

(c, d) = address;

// Inline declarations
(string e, string f) = address;

// Mixed
string g;

(g, string h) = address;
```

### Record/Class Deconstruction with Properties
```cs
public class/record Example
{
    string Name { get; set/init; }
    int Value { get; set/init; }

    public void Deconstruct(out string name, out int value) =>
        (name, value) = (Name, Value)

    // OR

    public void Deconstruct(out string name, out int value)
    {
        name = Name;
        value = Value;
    }
}

(string name, int value) = Example("The Name", 23);
```

### Pattern Matching

```cs
public record Shoe(string Color, bool HasLaces);
public record Person(string Name, Shoe Shoe);

Person person = new (
    "Mark D",
    new (
        "Teal",
        false
    )
)

if (person is Person {
        Shoe: {
            Color: "Red"
            HasLaces: false
        }
    }
    found
)
{
    Console.WriteLine($"{found.Name} has red shoes without laces");
}
else
{
    Console.WriteLine("Either 'person' was not a person or they didn't have the right shoes");
};

// OR

if (person is Person { Shoe.Color: "Red" } found)
{
    ...
};
```

## Delegates

> Delegates are typed method pointers.

```cs
// Classic delegate
public delegate int StringToIntDelegate(string input);

// Un-typed Lambda
Func<string, int> StringToIntLambda = s => int.Parse(s);

Delegate lambdaDelegate = StringToIntLambda; 
StringToIntDelegate typedLambda = StringToIntLambda;
var methodPointer = ToInt;

public int ToInt(string s) => { ... };

// Consume Lambda - This method is rigidly tied to the Func signature
static void UseLambda(Func<string, int> lambda) => _ = lambda("23");

UseLambda(StringToIntLambda);

// Using Delegate Type:
static void UseDelegate(Delegate delegate) => { ... }

UseDelegate(lambdaDelegate);
UseDelegate(typedLambda);
UseDelegate(methodPointer);
UseDelegate(ToInt);
UseDelegate(StringToIntLambda);
UseDelegate((string s) => int.Parse(s)); // Lambda types are inferred, ues (type t)

// Real World Example: Minimal Api
app.MapGet("/endpoint", async (IThing thing) => {
    var result = thing.DoWork();

    return result is null
        ? BadRequest("Null Result")
        : Results.Ok(result);
});

// id comes from Url, injectedThing comes from DI
app.MapGet("/endpoint/{id:int}", async (int id, IThing injectedThing) => {
    ...
});

// Override the id in the lambda using the FromBodyAttribute
app.MapGet("/endpoint/{id:int}", async (
    [FromBody]int id, IThing injectedThing
) => {
    ...
});
```

## StringBuilder and Interpolated String
> `StringBuilder` now accepts an **Interpolated String** template argument via the  
> overloaded `DefaultInterpolatedStringHandler` parameter type.

Interpolated strings are subject to [Boxing], `StringBuilder` now has an improvement  
which reduce or eliminate boxing in interpolated strings through the use of   
`DefaultInterpolatedStringHandler`

```cs
StringBuilder builder = new()
string result = builder.Append($"{str} and {i}");
```

[Boxing]: https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/types/boxing-and-unboxing
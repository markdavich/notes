# C#

- [C#](#c%23)
  - [String, Character, and Formatting Tips](#string%2C-character%2C-and-formatting-tips)
    - [Checking for Valid Unicode Characters](#checking-for-valid-unicode-characters)
    - [Formatting Strings](#formatting-strings)
      - [Consistent Column Width `{position, padding}`](#consistent-column-width-%60%7Bposition%2C-padding%7D%60)
      - [Positive, Negative, \& Zero Formatting \`{positive, negative, zero}](#positive%2C-negative%2C-%26-zero-formatting-%60%7Bpositive%2C-negative%2C-zero%7D)
    - [StringBuilder](#stringbuilder)
    - [Custom Format Providers](#custom-format-providers)
  - [Numbers \& Dates](#numbers-%26-dates)
    - [Parsing Strings Into Numbers](#parsing-strings-into-numbers)
      - [String to Integer](#string-to-integer)
    - [Preventing Ambiguous DateTime Parsing and Mis-Parsing](#preventing-ambiguous-datetime-parsing-and-mis-parsing)
    - [Parsing DateTimes with DateTimeStyles Enumeration](#parsing-datetimes-with-datetimestyles-enumeration)
    - [Representing Arbitrarily Large Integer Values](#representing-arbitrarily-large-integer-values)
    - [Random Numbers](#random-numbers)
    - [Creating Cryptographically Secure Random Numbers](#creating-cryptographically-secure-random-numbers)
    - [Generating Sequences of Integer Values](#generating-sequences-of-integer-values)
  - [Data Types and Objects](#data-types-and-objects)
    - [Using Tuples to Reduce the Amount of Code](#using-tuples-to-reduce-the-amount-of-code)
    - [Creating and Using Combinable Enums (Flags)](#creating-and-using-combinable-enums-(flags))
    - [Improving Struct Equality Performance](#improving-struct-equality-performance)
      - [A.Equals(B)](#a.equals(b))
      - [Ensure Performance by Overriding `Equals`](#ensure-performance-by-overriding-%60equals%60)
    - [Forcing Reference Equality Comparisons](#forcing-reference-equality-comparisons)
  - [Types for Working With Files, Paths, and URIs](#types-for-working-with-files%2C-paths%2C-and-uris)
    - [Simplifying Path Creation Code and Other Useful Methods](#simplifying-path-creation-code-and-other-useful-methods)
      - [System.IO.Path](#system.io.path)
        - [Gotchas](#gotchas)
    - [Working with URIs](#working-with-uris)
    - [Working with Zip Files](#working-with-zip-files)
    - [Compressing and Decompressing In-Memory Streams](#compressing-and-decompressing-in-memory-streams)
  - [Organizing and Structuring Classes and Code](#organizing-and-structuring-classes-and-code)
    - [The Danger of Virtual Method Calls from Constructors](#the-danger-of-virtual-method-calls-from-constructors)
    - [Simplifying Constructor Overloads (Constructor Chaining)](#simplifying-constructor-overloads-(constructor-chaining))
    - [Creating Methods that Take an Arbitrary Number of Arguments](#creating-methods-that-take-an-arbitrary-number-of-arguments)
    - [Using Indexers](#using-indexers)
    - [Partial Classes and Partial Methods](#partial-classes-and-partial-methods)
    - [Simplifying Code with Local Functions](#simplifying-code-with-local-functions)
    - [Creating Type Namespace Aliases](#creating-type-namespace-aliases)
    - [Using Keywords for Variable Names and Parameters](#using-keywords-for-variable-names-and-parameters)
    - [Exiting Loops Early](#exiting-loops-early)
  - [Compilation Tips](#compilation-tips)
    - [C# Preprocessor Directives](#c%23-preprocessor-directives)
    - [Implementing Conditional Compilation with Preprocessor Directives](#implementing-conditional-compilation-with-preprocessor-directives)
    - [Conditionally Compiling Code for Different Platforms](#conditionally-compiling-code-for-different-platforms)
    - [Defining Custom C# Compilation Symbols](#defining-custom-c%23-compilation-symbols)
    - [Emitting Custom C# Compiler Warnings and Errors](#emitting-custom-c%23-compiler-warnings-and-errors)
    - [Conditionally Calling a Method Based on Compilation Symbols](#conditionally-calling-a-method-based-on-compilation-symbols)
    - [Unit Testing Internal Methods](#unit-testing-internal-methods)
    - [Marking Code as Obsolete](#marking-code-as-obsolete)
    - [Binary Compatibility and Optional Parameters](#binary-compatibility-and-optional-parameters)
  - [Casting and Conversions](#casting-and-conversions)
    - [Converting Binary Data to ASCII with Base64 Encoding](#converting-binary-data-to-ascii-with-base64-encoding)
    - [Converting Base Types to Binary with BitConverter](#converting-base-types-to-binary-with-bitconverter)
    - [Runtime Conversions with Convert.ChangeType](#runtime-conversions-with-convert.changetype)
    - [Converting Characters to Numeric Values](#converting-characters-to-numeric-values)
    - [As or Cast?](#as-or-cast%3F)
  - [Runtime Execution](#runtime-execution)
    - [Consequences of Exceptions in Static Constructors](#consequences-of-exceptions-in-static-constructors)
    - [Getting Environment Information in C#](#getting-environment-information-in-c%23)
    - [Changing the Current Thread's Culture at Runtime](#changing-the-current-thread's-culture-at-runtime)
    - [Deferring Creation of Resource-intensive Objects until First Use](#deferring-creation-of-resource-intensive-objects-until-first-use)
    - [Exception Caching with `Lazy<T>`](#exception-caching-with-%60lazy%3Ct%3E%60)
    - [Creating Delays with Tasks](#creating-delays-with-tasks)
    - [Launching Arbitrary Programs and Processes](#launching-arbitrary-programs-and-processes)
    - [Capturing Process Output and Errors](#capturing-process-output-and-errors)
  - [General Tips](#general-tips)
    - [Merging IEnumerable Sequences Together (`.Zip`)](#merging-ienumerable-sequences-together-(%60.zip%60))
    - [Performing Set-based Operations on IEnumerable Sequences](#performing-set-based-operations-on-ienumerable-sequences)
      - [Concat](#concat)
      - [Union](#union)
      - [Intersect](#intersect)
      - [Except](#except)
    - [The Caller Information Attributes](#the-caller-information-attributes)
      - [\[CallerMemberName\]](#%5Bcallermembername%5D)
      - [\[CallerFilePath\] \& \[CallerLineNumber\]](#%5Bcallerfilepath%5D-%26-%5Bcallerlinenumber%5D)
    - [Non Short-circuiting Logical Operators in C#](#non-short-circuiting-logical-operators-in-c%23)
      - [Quick Example](#quick-example)
      - [Long Example](#long-example)
    - [Preserving Your Stack Trace When Re-throwing Exceptions](#preserving-your-stack-trace-when-re-throwing-exceptions)
    - [The Null-coalescing and Null-conditional C# Operators](#the-null-coalescing-and-null-conditional-c%23-operators)
- [Lessons](#lessons)
  - [C# Tips \& Traps](#%5Bc%23-tips-%26-traps%5D)


## String, Character, and Formatting Tips
<div style="margin-left: 2em;">

`IsNullOrWhiteSpace` is just like `IsNullOrEmpty` but it also checks if there is  
only **Whitespace**, if so it returns `true`... Start using this :)

- `string.IsNullOrWhiteSpace` returns **true** if
  - Is null
  - Is Empty
  - Is only whitespace characters returns **true** if
- `string.IsNullOrEmpty`
  - Is null
  - Is empty  
  *Note* this returns `false` if there are only whitespace

### Checking for Valid Unicode Characters
```cs
char code = GetCode();
UnicodeCategory category = char.GetUnicodeCategory(code);
bool isValidUnicode = category != UnicodeCategory.OtherNotAssigned;
```

### Formatting Strings
```cs
// This is a little klunky
string line = string.Format(
    "First Value: {0} Second Value: {1} Third Value: {2}",
    DateTime.Now,
    23,
    "Yellow"
)

// Much better
line = $"First Value: {DateTime.Now} Second Value: {23} Third Value: {"Yellow"}"
```

#### Consistent Column Width `{position, padding}`
Instead of using `PadLeft(...)` or `PadRight(...)` there is a formatting template  
which takes a `width` argument. The width argument is a integer which represents  
the total length of a "column", if it is *negative* the column will be aligned to   
the **Left** if it is *positive* the string will be aligned to the **right**

```cs
string leftAlign = "{0, -5}"
string rightAlign = "{1, 5}"

forEach(obj in objects) {
    string format = $"First: {leftAlign} Second: {rightAlign}"
    string line = string.Format(
        format,
        obj.ValueOne,
        obj.ValueTwo
    )
    Console.WriteLine(line)

    // Output
    // First: A      Second:     1
    // First: Be     Second:    23
    // First: Sea    Second:  2346     
    // First: Deagh  Second: 12345
}

// NOTE: This works in string interpolation as well!
string line = $"First: {obj.ValOne, -5} Second: {obj.ValTwo, 5}"
```

#### Positive, Negative, & Zero Formatting `{positive, negative, zero}
- Three part template separated by `;`
  - Part One — Used when the value is **positive** 
  - Part Two — Used when the value is **negative** 
  - Part Three — Used when the value is **Zero** 
- `#` will render the value
  
```cs
string template = "Positive: #; Negative: -#; Zero"
int[] values = { 0, 1, -1 }

Array.ForEach(values, (value) => {
    Console.WriteLine(value.ToString(template));
})

// Output
// Zero
// Positive: 1
// Negative: -1

```

### StringBuilder

This is more performant than manual concatenation.

Replace `str += $"{str}, "` with:

```cs

StringBuilder sb = new();

Array.ForEach(values, (value) => {
    sb.Append($"{value}");
    sb.Append(", ");
})

// Output
// 0, 1, -1, 

```

### Custom Format Providers

1. Create a **provider** class which implements `IFormatProvider` and `ICustomFormatter`

```cs
class Provider : IFormatProvider, ICustomFormatter
{
    // This belongs to ICustomFormatter
    public string Format(string format, object arg, IFormatProvider formatProvider)
    {
        // This is where the formatting is handled

        // Example
        int value = int(arg); // This formatter assumes that arg is an int

        if (value > 0)
        {
            return $"{value} is Greater Than Zero";
        }

        return $"{value} is Less Than One";
    }

    // This belongs to IFormatProvider
    public object GetFormat(Type formatType) 
    {
        // Tells caller (string.Format) what object provides the formatting capability
        if (formatType == typeof(ICustomFormatter))
        {
            // This will point the formatting to this.Format above
            return this;
        }

        return null;
    }
}

// Usage values =  { 0, 1, -1 };
Array.ForEach(values, (value) => {
    string formatted = string.Format(
        new Provider(),
        "Value: {0}",
        value
    )

    Console.WriteLine(formatted);
});

// Output
// Value: 0 is Less Than One
// Value: 1 is Greater Than Zero
// Value: -1 is Less Than One

```
</div>

## Numbers & Dates
<div style="margin-left: 2em;">

### Parsing Strings Into Numbers

#### String to Integer
`NumberStyles` is used to tell the parser what is acceptable input

```cs
using System.Globalization;

string value = "23";

// string hex = int.Parse(value, NumberStyles.HexNumber);

string int = int.Parse(value, NumberStyles.Integer);
```

### Preventing Ambiguous DateTime Parsing and Mis-Parsing
> This can be done using `DateTime.ParseExact(value, "format string")`

`DateTime.Parse(...)` uses the local of the machine it is running on, so if the  
local expects dates to be "dd/mm/yyyy" an exception will be thrown if a "mm/dd/yyyy"  
or other date format is used. *This gets really weird* when values between **1 and 12**  
are used, since the function can't tell which format is being used. For example,  
if the local is using `dd/mm/yyyy` and a user passes a `mm/dd/yyyy` value of `5/8/2025`  
the function will return `August, 5th, 2025` instead of what the user expected, which  
is `May, 8th, 2025`.

This ambiguity can be overcome by specifying the exact date format:

```cs

string value = "2025/11/11";
DateTime dateTime = DateTime.ParseExact(value, "YYYY/MM/dd");
```

### Parsing DateTimes with DateTimeStyles Enumeration
```cs

string value = "2025/11/11";

// This trows
DateTime dateTime = DateTime.Parse(value, null, DateTimeStyles.AssumeLocal);

value = "11/11/2025";
// This works
dateTime = DateTime.Parse(value, null, DateTimeStyles.AssumeLocal);
```

### Representing Arbitrarily Large Integer Values

Learn about `BigInteger` vs `int`  
- `BigInteger` can hold 2.14 billion bits in `.NET 9`
  - 267.5 million `ASCII` characters (for integers, 0-9)
  - 66.875 million `UTF-32` (4 bytes/character)
  - 133.75 million `UTF-16` (2 bytes/character)
  - 66.875 - 267.5 million `UTF-8` (variable length encoding, )
  - 267.5 million `ASCII` (7 bits/character)

### Random Numbers

> Note, the reason `max + 1` is used makes it so teh `Next(...)` method will include  
> the **maximum** value, otherwise, `max` will be excluded.

Passing a static **seed** value to the `Random` constructor will produce identical  
results when using `Next()` in succession. Two consecutive instances of `Random` will  
most likely produce duplicate values.

- Random objects are not thread safe
- Not completely random, but sufficient for practical purposes
- The same seed value in different **.NET** version is not guaranteed to produce the same results.

```cs

Random random = new(); // System clock is the seed value
int min = 23;
int max = 46;
int i;

i = random.Next();             // returns non-negative integer
i = random.Next(max + 1);      // returns non-negative less than or equal to max (0 to 46)
i = random.Next(min, max + 1); // returns inclusive value between `min` and `max + 1` (23 to 46)

byte[] bytes = random.NextBytes(Byte[] ba); // Creates byte array same size as ba
float float = random.NextFloat(); // 0.0 >= float < 1.0
```

### Creating Cryptographically Secure Random Numbers
- ⚠️ `RNGCryptoServiceProvider` is Obsolete ⚠️
```cs
using System.Security.Cryptography;

// ☢️ DON'T DO THIS ☢️
// Random Number Generator (RNG)
// RandomNumberGenerator now 
// The provider implements IDisposable so it is wrapped in a using statement
using (RNGCryptoServiceProvider provider = new())
{
    // 1. Provider creates an array of random bytes
    // 2. Then the array is converted to a data type

    int bytesPerInt = 4;
    byte[] bytes = new byte[bytesPerInt];
    provider.GetBytes(bytes);

    // bytes is now filled with cryptographically secure values
    // now convert bytes to an int

    // This is a cryptographically secure random number (int)
    int result = BitConverter.ToInt32(bytes, 0);

    Console.WriteLine(result);
}


// ✅ Correct Way
using (RandomNumberGenerator rng = RandomNumberGenerator.Create())
{
    int bytesPerInt = 4;
    byte[] bytes = new byte[bytesPerInt];
    rng.GetBytes(bytes); // The array is now filled with cryptographically strong random bytes.
}


```

### Generating Sequences of Integer Values

```cs
List<int> daysList = new() { 1, 2, 3, 4, 5 };

// Or you can use this:
days = Enumerable.Range(1, 5).ToList();
```
</div>

## Data Types and Objects
<div style="margin-left: 2em;">

### Using Tuples to Reduce the Amount of Code
> "Two-ples" or "Tuh-ples"  
> These can be used to as a quick key value pair (sort of), think of it as storing related  
> pairs of data.

```cs
(int, string) intStringTuple = (23, "Twenty Three");

int i = intStringTuple.Item1;
string s = intStringTuple.Item2;


(int Value, string Name) valueNameTuple = (23, "Twenty Three");

i = valueNameTuple.Value;
s = valueNameTuple.Name;
```

### Creating and Using Combinable Enums (Flags)
```cs
[Flags]
public enum Combinable
{
    None = 0,
    One = 1,
    Two = 2,
    Four = 4,
    Eight = 8,

    Three = One | Two,
    Five = One | Four,
    Six = Two | Four,
    Seven = One | Two | Four,

    Nine = One | Eight,

    All = One | Two | Four | Eight
}


public string Process(string s, Combinable c) 
{
    string result = s;

    // NOPE, This doesn't work :(
    // switch (c)
    // {
    //     case ContainsFlag(Combines.One):
    //         result = ProcessOne(result);

    //     case ContainsFlag(Combines.Two):
    //         result = ProcessTwo(result);

    //     ...

    //     case ContainsFlag(Combines.Eight):
    //         result = ProcessEight(result);
    // }

    if (c.ContainsFlag(Combines.One)) {
        result = ProcessOne(result);
    }

    // ...

    if (c.ContainsFlag(Combines.Eight)) {
        result = ProcessEight(result);
    }

    return result; // Note that if only Combinable.None is passed, s, is unaltered
}

public string ProcessOne(string s)
{

}

Combinable oneFourAndEight = Combinable.One | Combinable.Four | Combinable.Eight;

string processed = Process("My Value", oneFourAndEight);

processed = Process("My Other Value", Combinable.Nine); // One and Eight

// public string ProcessNone(string s) ...
// public string ProcessTwo(string s) ...
// public string ProcessFour(string s) ...
// public string ProcessEight(string s) ...
```

### Improving Struct Equality Performance

#### A.Equals(B)

In a `struct`, if none of the fields are reference types, the `Equals` method  
performs a **byte-by-byte** comparison of the the two objects in memory,  
  
**Otherwise**, reflection is used; this can be an expensive operation (in the order  
of seconds)

We want to avoid **Reflection** to compare objects.

In `C#` there are two kinds of type, **Reference** and **Value**

| Kind          | Types                                                                                                                     |
| :------------ | :------------------------------------------------------------------------------------------------------------------------ |
| **Reference** | `class`, `interface`, `delegate`, `record`, `dynamic`, `object`, `string`                                                 |
| **Value**     | `struct`, `enum`, `bool`, `char`, [Integral numeric types]: `byte`, `int`, `short...`,  [Floating-point numeric types]... |

#### Ensure Performance by Overriding `Equals`
```cs
public struct WithRefType
{
    public int ValueType { get; set; }
    public string ReferenceType { get; set; }

    // Override the Equals method to avoid reflection
    public override bool Equals(object obj) {
        if (!(obj is WithRefType)) {
            return false;
        }

        WithRefType toCompare = (WithRefType)obj;

        return
            ValueType == toCompare.ValueType
            &&
            ReferenceType == toCompare.ReferenceType;
    }
}


WithRefType A = new(); // Set some values
WithRefType B = new(); // Set some values


bool isEqual = A.Equals(B);
```

### Forcing Reference Equality Comparisons

```cs
Uri a = new("url one"); // Memory address 1
Uri b = new("url one"); // Memory address 2

// Uri (A reference type) overrides Equality and uses Value comparisons.
bool areEqual = a == b;
bool isSameReference = object.ReferenceEquals(a, b); // False

a = b;

bool isSameReference = object.ReferenceEquals(a, b); // True
```

</div>

## Types for Working With Files, Paths, and URIs
<div style="margin-left: 2em;">

### Simplifying Path Creation Code and Other Useful Methods

#### System.IO.Path

- `Path.Combine()`;
- `Path.ChangeExtension(path, "bak")`
- `Path.GetInvalidFileNameChars()`
- `Path.GetRandomFileName()`
- `Path.GetTempFileName()`
- `Path.GetTempPath()`
- `Path.DirectorySeparatorChar`
- `Path.Join(...)` or `Path.TryJoin(...)` instead of `Combine(...)`
- `Path.GetFullPath(path)` will ***resolve*** things  like `C:\Temp\..` or `%APPDATA%\My\Folder`

##### Gotchas
When using `Combine(...)`, you need to learn about [Path: Absolute Components]

- This method assumes that the first argument is an absolute path and that the  
  following argument or arguments are relative paths. If this is not the case, and  
  particularly if any subsequent arguments are strings input by the user, call the  
  Join or TryJoin method instead.
- The second argument **must *Not*** have a leading backslash, otherwise it will  
  only return the second argument
- If an argument other than the first contains a rooted path, any previous path  
  components are ignored, and the returned string begins with that rooted path  
  component

```cs
using System.IO;

string drive = "C:\\"; // Must end with a trailing backslash
string directory = "";
string file = "";

string path = Path.Combine(drive, directory, file);
```

### Working with URIs

Use the **Uri** or **UriBuilder** object to build Uri objects, don't do it manually.

- `new Uri()`
- UriKind
- IsFile
- IsUnc

```cs
Uri uri = new("some uri");

// uri.ToString() => some uri/

uri = new("some uri/path")
// uri.ToString() => some uri/path 
```

### Working with Zip Files
- `ZipFile.CreateFromDirectory(source, destination, ...)`
- `ZipFile.ExtractToDirectory(source, destination)`
- `using (ZipArchive zip = ZipFile.Open(source, ZipArchiveMode))`
  - `=> zip.CreateEntryFromFile(source, name)`
  - `=> zip.GetEntry(source).Delete()`


```cs
using System.IO.Compression;
```

### Compressing and Decompressing In-Memory Streams

```cs
byte[] bytes = Encoding.ASCII.GetBytes(someString);

FileProcessor sut = new(); // sut = System Under Test

// Compress
byte[] compressed = sut.Compress(bytes);

// Info
int bytesSize = bytes.Length;
int compressedSize = compressed.Length;
int diff = bytesSize - compressedSize;

// Decompress
byte[] decompressed = sut.Decompress(compressed);
string decompressedString = Encoding.ASCII.GetString(decompressed);

Assert.Equal(bytes, decompressed);
Assert.Equal(someString, decompressedString);

public class FileProcessor
{
    public byte[] Compress(byte[] bytes)
    {
        using (ms = new MemoryStream())
        {
            using (var gzs = new GZipStream(ms, CompressionMode.Compress)) 
            {
                gzs.Write(bytes, 0, bytes.Length);
            }

            byte[] compressed = ms.ToArray();

            return compressed
        }
    }

    public byte[] Decompress(byte[] bytes)
    {
        using (ms = new MemoryStream(bytes))
        using (decompressedMs = new MemoryStream())
        using (gzs = new GZipStream(ms, CompressionMode.Decompress))
        {
            gzs.CopyTo(decompressedMs);

            byte[] decompressedBytes = decompressedMs.ToArray();

            return decompressedBytes;
        }
    }
}
```

</div>

## Organizing and Structuring Classes and Code
<div style="margin-left: 2em;">

### The Danger of Virtual Method Calls from Constructors
A derived class may override the virtual method, and break the base initialization  
flow.

### Simplifying Constructor Overloads (Constructor Chaining)

```cs
public class Example
{
    // This is constructor chaining
    public Example(int a) : this(a, -1, -2) { }

    public Example(int a, int b) : this(a, b, -2) { }

    public Example(int a, int b, int c)
    {

    }
}
```

### Creating Methods that Take an Arbitrary Number of Arguments

Use the `params` keyword

```cs
public class Example
{
    public Example(int a, params objects[] objects)
    {
        WriteLine(a);
        objects.ForEach(o => {
            WriteLine(o.ToString());
        });
    }
}
```

### Using Indexers

> **Indexers** allow instances of a `class` or `struct` to be  
> indexed just like arrays. The indexed value can be set or  
> retrieved without explicitly specifying a type or instance  
> member.

```cs
public class Example
{
    public string[] Items;
    public string this[int i]
    {
        get => Items[i];
        set => Items[i] = value;
    }
}
```

### Partial Classes and Partial Methods

```cs
// Example.cs
public partial class Example
{
    public void Main()
    {
        // Custom code
    }

    partial void PartialMethod() // signature matches definition
    {
        // Implementation...
    }
}

// Example.more.cs
public partial class Example
{
    public void More()
    {
        PartialMethod();
    }

    partial void PartialMethod(); // No Implementation or { } or access modifier
}
```


### Simplifying Code with Local Functions

```cs
public class Example
{
    public void WithLocalMethod(string s)
    {
        string local;

        string Process(string s)
        {
            // can access local variables, like, local
            return $"{s} was processed"
        }

        string result = s.Replace("a", "b");

        return Process(result);
    }
}
```

### Creating Type Namespace Aliases

When a Type name is used multiple times for different types:

```cs
// Namespace Aliases
using UtilExample = Abc.Utils.Example;
using ImplExample = Abc.Impl.Example;


// --------------------------
namespace Abc.Utils;
public class Example { }
// --------------------------
namespace Abc.Impl;
public class Example { }
// --------------------------
```

### Using Keywords for Variable Names and Parameters

Prefix keyword with an `@` to use the keyword as a variable name.

```cs
byte @byte;
int @int;
```

### Exiting Loops Early

```cs
foreach (a in b) 
{
    continue; // goes to next a
    break; // terminates the loop and goes to next statement outside of loop
}
```
</div>

## Compilation Tips
<div style="margin-left: 2em;">

### C# Preprocessor Directives

```cs
// Symbol Definition
#define // Define a new symbol
#undef // Clear a defined symbol

// Conditional
#if
#else
#elif
#endif

// Compilation Feedback
#warning
#error

// Organization
#region 
#endregion

#nullable disable
#nullable enable
```

### Implementing Conditional Compilation with Preprocessor Directives
```cs
    string a;

#if DEBUG
    a += "DEBUG";
#endif

#if RELEASE
    a += "RELEASE";
#endif
```

### Conditionally Compiling Code for Different Platforms
`.csproj`

```xml
<PropertyGroup>
    <!-- Note that Frameworks is PLURAL -->
    <TargetFrameworks>net40;netcoreapp2.0</TargetFrameworks>
</PropertyGroup>
```

After saving the `.csproj` file, you will see both platforms in the `bin` folder

```cs
#if NETCOREAPP2_0
    a += o.GetType().GetTypeInfo().Namespace;
#elif NET40
    a += o.GetType().Namespace;
#else
    throw NotSupportedException("Only core 2.0 and .NET Framework 4 supported");
#endif
```

### Defining Custom C# Compilation Symbols
This is a way to simplify pre-processor directive logic. A symbol can be created  
for a specific platform and referenced in code, this makes it so we don't need to  
rely solely on `#if PLATFORM_SYMBOL` in the code.

`.csproj`
```xml
<PropertyGroup>
    <DefineConstants>CUSTOM_SYMBOL</DefineConstants>
</PropertyGroup>

<!-- Define symbol for specific platform -->
<PropertyGroup Condition="$(TargetFramework.StartsWith('net4'))">
    <DefineConstants>CUSTOM_SYMBOL</DefineConstants>
</PropertyGroup>
```

```cs
#define CUSTOM_SYMBOL // Top of file if not in .csproj

#if CUSTOM_SYMBOL
    a += "Custom Action";
#endif
```

### Emitting Custom C# Compiler Warnings and Errors
This makes it so we can catch errors at compile time, and not worry about breaking  
the `RELEASE` build in production.

- Don't `throw`
- Use `#warning` when you need to know
- Use `#error` when the app won't work

```cs
#if CUSTOM_SYMBOL
#else
    // Don't do this:
    // throw NotSupportedException("Only core 2.0 and .NET Framework 4 supported");

    // If you just want to know use #warning
    #warning CUSTOM_SYMBOL NOT Defined

    // If you want to fail the build, use #error
    #error CUSTOM_SYMBOL NOT Accounted for, you need to fix this!
#endif
```

### Conditionally Calling a Method Based on Compilation Symbols
⚡ RESUME HERE

```cs
using System.Diagnostics;

Method(); // Will only get called if in "DEBUG"

[Conditional("DEBUG")] // Only get's compiled into assembly if "DEBUG"
public void Method() { }
```

### Unit Testing Internal Methods
```cs
// SomeClass.cs
[assembly: InternalsVisibleTo("Def.Tests")]

namespace Abc.Utils;

internal void Method() { }

// SomeTests.cs
namespace Def.Tests;

[Fact]
public void TestTheInternalMethod()
{
    Abc.Utils.Method();
}
```

### Marking Code as Obsolete
```cs
// Show a compiler warning
[Obsolete("This method will be removed next release")]
public void Method();

// Fail the build (using the second parameter true)
[Obsolete("This method is no longer available", true)]
public void Method();

[Obsolete("This class will be removed next release", false)]
public class Example { }
```

### Binary Compatibility and Optional Parameters

If you add an optional parameter to a `Class Library` method, rebuild the  
`Class Library`, and use the new `.dll` in an existing app (without rebuilding)  
the app, you will get an error, something like "method not found".  

Don't replace `.dlls`

</div>

## Casting and Conversions
<div style="margin-left: 2em;">

- Binary to ASCII using Base64 Encoding
- Converting Base Types to Binary
- Runtime Type Conversions with `Convert.ChangeType`
- Converting `Char` to Numeric Character Code


### Converting Binary Data to ASCII with Base64 Encoding
```cs
private void Convert()
{
    // File Bytes to String
    byte[] bytes File.ReadAllBytes("myFile");
    string base64String = Convert.ToBase64String(bytes);

    // Base64 String to Bytes
    byte[] original = Convert.FromBase64String(base64String);
}
```

```html
<!-- src can also hold the literal Base64 Encoded string (after base64,) -->
<img 
    id="img" 
    src="data:image/png;base64,base64String loaded in script" 
    alt="Image Using Base64 Encoded String" />

<script>
    const base64Prefix = "data:image/png;base64,"
    const base64String = "iVBOR ... ErkJggg=="
    const src = `${base64Prefix}${base64String}`

    document.getElementById("img").src = src
</script>
```

### Converting Base Types to Binary with BitConverter
```cs

- Use `BitConverter.GetBytes(...)` to convert primitive base types to Binary
- User `DateTime.ToBinary()` to convert dates to binary then use `BitConverter`...

private void Convert()
{
    // Int to Binary
    string s = "32";
    int i = int.Parse(s);
    byte[] bytes = BitConverter.GetBytes(i);

    // Date to Binary
    DateTime dt = DateTime.Now;
    long dtLong = dt.ToBinary();
    byte[] dtBytes =  BitConverter.GetBytes(dtLong);
}
```

### Runtime Conversions with Convert.ChangeType
Dynamically change type during runtime
```cs
// Setup
object source = 23;
object destination;
Type target;

// Convert by Type
target = int.GetType();
destination = Convert.ChangeType(source, target);

// Convert by Type Name
target = Type.GetType("System.Int32");
destination = Convert.ChangeType(source, target);
```

### Converting Characters to Numeric Values
- Use `char.GetNumericValue(...)` to convert a "Numeric" character to a double

```cs
char char = '7';

// Get the Character Code
double code = char.GetNumericValue(char); // This get

```

### As or Cast?
```cs
// Casting throws exceptions
DateTime dt = (DateTime)(Enumerable.Empty<string>());

// "As" only tries, it doesn't throw
DateTime dt = Enumerable.Empty<string>() as DateTime;

// Both are problematic in this example
```
</div>


## Runtime Execution
<div style="margin-left: 2em;">

### Consequences of Exceptions in Static Constructors
If an exception occurs in a static constructor of a class, the Class Type will  
not be available for the rest of the Run Time. 

### Getting Environment Information in C#
|     Environment.Property | Description                                                                                                                                                                                                                  |
| -----------------------: | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|            `CommandLine` | Gets the command line for this process.                                                                                                                                                                                      |
|               `CpuUsage` | Get the CPU usage, including the process time spent running the application code, the process time spent running the operating system code, and the total time spent running both the application and operating system code. |
|       `CurrentDirectory` | Gets or sets the fully qualified path of the current working directory.                                                                                                                                                      |
| `CurrentManagedThreadId` | Gets a unique identifier for the current managed thread.                                                                                                                                                                     |
|               `ExitCode` | Gets or sets the exit code of the process.                                                                                                                                                                                   |
|     `HasShutdownStarted` | Gets a value that indicates whether the current application domain is being unloaded or the common language runtime (CLR) is shutting down.                                                                                  |
| `Is64BitOperatingSystem` | Gets a value that indicates whether the current operating system is a 64-bit operating system.                                                                                                                               |
|         `Is64BitProcess` | Gets a value that indicates whether the current process is a 64-bit process.                                                                                                                                                 |
|    `IsPrivilegedProcess` | Gets a value that indicates whether the current process is authorized to perform security-relevant functions.                                                                                                                |
|            `MachineName` | Gets the NetBIOS name of this local computer.                                                                                                                                                                                |
|                `NewLine` | Gets the newline string defined for this environment.                                                                                                                                                                        |
|              `OSVersion` | Gets the current platform identifier and version number.                                                                                                                                                                     |
|              `ProcessId` | Gets the unique identifier for the current process.                                                                                                                                                                          |
|         `ProcessorCount` | Gets the number of processors available to the current process.                                                                                                                                                              |
|            `ProcessPath` | Returns the path of the executable that started the currently executing process. Returns null when the path is not available.                                                                                                |
|             `StackTrace` | Gets current stack trace information.                                                                                                                                                                                        |
|        `SystemDirectory` | Gets the fully qualified path of the system directory.                                                                                                                                                                       |
|         `SystemPageSize` | Gets the number of bytes in the operating system's memory page.                                                                                                                                                              |
|              `TickCount` | Gets the number of milliseconds elapsed since the system started.                                                                                                                                                            |
|            `TickCount64` | Gets the number of milliseconds elapsed since the system started.                                                                                                                                                            |
|         `UserDomainName` | Gets the network domain name associated with the current user.                                                                                                                                                               |
|        `UserInteractive` | Gets a value indicating whether the current process is running in user interactive mode.                                                                                                                                     |
|               `UserName` | Gets the user name of the person who is associated with the current thread.                                                                                                                                                  |
|                `Version` | Gets a version consisting of the major, minor, build, and revision numbers of the common language runtime.                                                                                                                   |
|             `WorkingSet` | Gets the amount of physical memory mapped to the process context.                                                                                                                                                            |

### Changing the Current Thread's Culture at Runtime
This would be used if an application had a selectable country/region

```cs
using System.Globalization;
using System.Threading;

CultureInfo info = CultureInfo.GetCultureInfo("aa-BB");
Thread.CurrentThread.CurrentCulture = info;
```

### Deferring Creation of Resource-intensive Objects until First Use
```cs
public class TakesForeverToCreate { }

Lazy<TakesForeverToCreate> thing = new Lazy<TakesForeverToCreate>();

if (true) 
{
    string a = thing.Value.Name; // This is where the thing gets instantiated
}
```

### Exception Caching with `Lazy<T>`
`Lazy<T>` is always the same instance, the **Lazy<T>**.`Value` is *Read-Only*  

```cs
public class T
{
    T() { throw new Exception($"ctor Exception at {DateTime.Now.Ticks}"); }
}

Lazy<T> lazy = new Lazy<T>();

// No exception caching... Different exception instances
Run(); // ex instance one "ctor Exception at 2346"
Run(); // ex instance two "ctor Exception at 3264"

// Exception Caching is enabled by using the "function" overload for Lazy
lazy = new Lazy<T>(() => new T());

// Same exception instance
Run(); // ex instance one "ctor Exception at 2332"
Run(); // ex instance one "ctor Exception at 2332"

public void Run()
{
    try
    {
        lazy.Value.SomeMethod();
    }
    catch (Exception ex)
    {

    }
}
```

### Creating Delays with Tasks

```cs
private async Task Load()
{
    int times;

    WriteLine("Loading...")

    while (times < 10)
    {
        await Task.Delay(1000);
        WriteLine($"Loading {(time + 1)}")
        times++
    }
}

Load(); // Wait 1 second between while operations
/* Output

    Loading...
    Loading 1  (1 second later)
    ...
    Loading 10 (1 second later)

 */
```

### Launching Arbitrary Programs and Processes

- Use the `Process` class to run programs
  
```cs
using System.Diagnostics;

// No parameters
_ = Process.Start("notepad.exe")

// Single Parameter
string path = "C:\\temp\\text.txt";
_ = Process.Start("notepad.exe", path)

// Use ProcessStartInfo
ProcessStartInfo info = new()
{
    FileName = "notepad.exe",
    Arguments = path,
    WindowsStyle = ProcessWindowStyle.Maximized
};

_ = Process.Start(info);
```

### Capturing Process Output and Errors

```cs
using System.Diagnostics;

ProcessStartInfo info = new()
{
    FileName = "cmd.exe",
    Arguments = "/C DATE /T",
    RedirectStandardOutput = true, // Allows to read cmd output
    UseShellExecute = false // Allow redirection of output
};

Process cmd = Process.Start(info);

string out = cmd.StandardOutput.ReadToEnd(); // out = 'Mon 12/23/2023'
```
</div>

## General Tips
<div style="margin-left: 2em;">

### Merging IEnumerable Sequences Together (`.Zip`)

```cs
using System.Linq;

IEnumerable<string> names = new string[] { "Red", "Green", "Blue" };
IEnumerable<string> values = new string[] { "FF0000", "00FF00", "0000FF" };

// This Zips or Joins two values from IEnumerables using a delagate of
// (TSource, TToZip)
IEnumerable<string> joined = names.Zip(
    values, 
    (string name, string value) => {
        return $"{name} (HEX: {value})";
    }
)
```

### Performing Set-based Operations on IEnumerable Sequences
#### Concat
#### Union
#### Intersect
#### Except

```cs
using System.Linq;

IEnumerable<string> seq1 = new string[] { "Red", "Green", "Blue" };
IEnumerable<string> seq2 = new string[] { "Red", "Orange", "Yellow" };

IEnumerable<string> concat = seq1.Concat(seq2);
// Red, Green, Blue, Red, Orange, Yellow (duplicate Red)

IEnumerable<string> union = seq1.Union(seq2);
// Red, Green, Blue, Orange, Yellow (removes duplicate Red)

IEnumerable<string> intersect = seq1.Intersect(seq2);
// Red (Returns values that are in both sets)

IEnumerable<string> except = seq1.Except(seq2);
// Green, Blue (Values in first that don't exist in second)
```

### The Caller Information Attributes

- `INotifyPropertyChanged` & `[CallerMemberName]` Attribute
- `CallerFilePath`
- `CallerLineNumber`
  
#### [CallerMemberName]

```cs
using System.ComponentModel;

public class Example : INotifyPropertyChanged
{
    private string _name;

    // Implements the INotifyPropertyChanged interface
    public event PropertyChangedEventHandler PropertyChanged;

    public string Name
    {
        get => _name;
        set
        {
            _name = value;
            OnPropertyChangedVerbose(nameof(Name)); // Verbose call
            OnPropertyChanged(); // Simple Call, no magic strings
        }
    }

    protected virtual void OnPropertyChangedVerbose(string propertyName)
    {
        PropertyChanged?.Invoke(
            this, 
            new PropertyChangedEventArgs(propertyName)
        );
    }

    protected virtual void OnPropertyChanged(
        [CallerMemberName] string propertyName = null
    )
    {
        PropertyChanged?.Invoke(
            this, 
            new PropertyChangedEventArgs(propertyName)
        );
    }
}
```

#### [CallerFilePath] & [CallerLineNumber]

```cs
// Test.cs
Example.GetFileName(); // Returns Fully\Qualified\Path\To\Test.cs
Example.GetLineNo(); // Returns This line number

// Example.cs
private void GetFileName([CallerFileName] string callingFile = null) => callingFile;
private void GetLinNo([CallerLineNumber] int callingLineNo = null) => callingLineNo;
```

### Non Short-circuiting Logical Operators in C#
- Use single `&` or `|` to stop short-circuiting logical **AND** & **OR**

#### Quick Example
```cs
// Using single & or | evaluates both expressions
bool and = a & b;
bool or = a | b;
```

#### Long Example

```cs
string a = "A";
bool isTrue = false;

// Short-Circuiting Logical AND
bool shortCircuitBool = isTrue && a == "A"; // a == "A" is NOT evaluated
shortCircuitBool = isTrue && CheckName();   // CheckName() is NOT called

// Non-Short-Circuiting Logical AND using single &
bool nonShortCircuitBool = isTrue & a == "A" // a == "A" IS evaluated
nonShortCircuitBool = isTrue & CheckName()   // CheckName() IS called

private bool CheckName() => a == "A";
```

### Preserving Your Stack Trace When Re-throwing Exceptions

```cs
private void Method1()
{
    try
    {
        Method2(); // Line 1
    }
    catch (Exception ex)
    {
        // Line 1 > Line 23 > Line 46
    }
}

private void Method2()
{
    try
    {
        Method3() // Line 23
    }
    catch (Exception) // EXCLUDE the instance variable "ex"
    {
        throw; // "throw" ONLY
    }
}

private void Method3()
{
    throw new Exception("Method 3 exception"); // Line 46
}

```

### The Null-coalescing and Null-conditional C# Operators
- Null-Coalescing `??`
- Null-Conditional `a?.Method() ??`

```cs
// Old Way:
//  if a is null return "a is null"
//  otherwise, return a
string b = a is null ? "a is null" : a;

// ╭──────────────────────────╮
// │ New Way: Null-Coalescing │
// ╰──────────────────────────╯
//  Same as above using Null-Coalescing ??
//  Return a if it is not null (??)
//  otherwise return "a is null"
string b = a ?? "a is null";

// ╭────────────────────────────────────╮
// │ Chaining Null-Coalescing Operators │
// ╰────────────────────────────────────╯
int? a = null;
int? b = null;
int c = 23;

// If a is null return b
// If b is null return c
int result = a ?? b ?? c;

// ╭───────────────────────────╮
// │ Null-Conditional Operator │
// ╰───────────────────────────╯
string a = null;
string b;

// Old Way:
if (a is null) {
    b = "a is null, no UPPER value";
}
else
{
    b = a.ToUpperInvariant();
}

// New Way:
//  a? checks if a is null, if it is not, .ToUpperInvariant() will be called
//  and returned, otherwise a?.ToUpperInvariant() will evaluate to null, causing
//  the the returned value to be the "string"
b = a?.ToUpperInvariant() ?? "a is null, no UPPER value";
```

</div>

[Integral numeric types]:https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/integral-numeric-types
[Floating-point numeric types]: https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/floating-point-numeric-types
[Path: Absolute Components]: https://learn.microsoft.com/en-us/dotnet/api/system.io.path.combine?view=net-9.0#:~:text=any%20previous%20path,an%20absolute%20path

# Lessons
## [C# Tips & Traps]

| Completed | Title                                          | Time    | Actual Time |
| :-------: | :--------------------------------------------- | :------ | ----------: |
|     ✅     | [Course Overview]                              | `1:08`  |      `1:08` |
|     ✅     | [String, Characters, and Formatting Tips]      | `30:02` |   `1:00:00` |
|     ✅     | [Tips for Working with Numbers and Dates]      | `29:07` |   `1:10:00` |
|     ✅     | [Data Types and Object Tips]                   | `21:42` |     `50:00` |
|     ✅     | [Tips for Working with Files, Paths, and URIs] | `29:22` |   `1:00:00` |
|     ✅     | [Organizing and Structuring Classes and Code]  | `24:10` |     `45:00` |
|     ✅     | [Compilation Tips]                             | `28:23` |     `45:00` |
|     ✅     | [Tips for Casting and Conversions]             | `20:39` |     `45:00` |
|     ✅     | [Runtime Execution Tips]                       | `27:52` |   `1:00:00` |
|     ✅     | [Bonus Tips]                                   | `34:51` |   `1:00:00` |


[C# Tips & Traps]: https://app.pluralsight.com/ilx/video-courses/10ec35af-2ed3-414e-aba8-8d2a907e2841/ded43235-1576-485f-b01c-152146d70ab8/9624b738-574c-449d-89e3-145829161dcc
[Course Overview]: https://app.pluralsight.com/ilx/video-courses/10ec35af-2ed3-414e-aba8-8d2a907e2841/ded43235-1576-485f-b01c-152146d70ab8/9624b738-574c-449d-89e3-145829161dcc
[String, Characters, and Formatting Tips]: https://app.pluralsight.com/ilx/video-courses/10ec35af-2ed3-414e-aba8-8d2a907e2841/20a02c2e-c966-401d-8590-afc425752fee/856a2008-0fe0-4821-af13-e3919deffb4a
[Tips for Working with Numbers and Dates]: https://app.pluralsight.com/ilx/video-courses/10ec35af-2ed3-414e-aba8-8d2a907e2841/57e1532a-ff48-4459-9591-d3ad1776512f/61436cc5-0694-4c5a-b1b2-cead03a5574a
[Data Types and Object Tips]: https://app.pluralsight.com/ilx/video-courses/10ec35af-2ed3-414e-aba8-8d2a907e2841/198f346d-4cbe-4c82-93ad-bb3fc20133ea/97cfc543-8d24-4274-9136-ee4b47b586bc
[Tips for Working with Files, Paths, and URIs]: https://app.pluralsight.com/ilx/video-courses/10ec35af-2ed3-414e-aba8-8d2a907e2841/6c14a58c-3dd8-47d4-b37e-a1d03fab47d7/3088b3d8-13c5-4389-8c62-8a5fc08626a5
[Organizing and Structuring Classes and Code]: https://app.pluralsight.com/ilx/video-courses/10ec35af-2ed3-414e-aba8-8d2a907e2841/c8c626ba-1400-46e6-bdbd-6b71e2a78787/eb69ec54-5de2-4b02-80c6-2963cf89f8db
[Compilation Tips]: https://app.pluralsight.com/ilx/video-courses/10ec35af-2ed3-414e-aba8-8d2a907e2841/90e22150-312d-42dc-a2eb-6f44e861217e/b4115a87-c3fd-456e-99e9-c045b8c0e8bc
[Tips for Casting and Conversions]: https://app.pluralsight.com/ilx/video-courses/10ec35af-2ed3-414e-aba8-8d2a907e2841/a076d0d1-c800-479c-ba80-1f3bbdc8e7f3/b27045f9-3214-45b8-8d45-77f915916558
[Runtime Execution Tips]: https://app.pluralsight.com/ilx/video-courses/10ec35af-2ed3-414e-aba8-8d2a907e2841/f127ec47-9df5-4af9-90f1-09077cef983e/821529ed-0157-42a2-b35d-4ec9a31d66e4
[Bonus Tips]: https://app.pluralsight.com/ilx/video-courses/10ec35af-2ed3-414e-aba8-8d2a907e2841/1d5c44de-2cea-488b-814d-80ca2acaaea0/1afeec3d-1302-4b59-a6f4-45d3a3af6e59
# C#

- [C#](#c%23)
  - [String, Character, and Formatting Tips](#string%2C-character%2C-and-formatting-tips)
    - [Checking for Valid Unicode Characters](#checking-for-valid-unicode-characters)
    - [Formatting Strings](#formatting-strings)
      - [Consistent Column Width](#consistent-column-width)
      - [Positive, Negative, \& Zero Formatting](#positive%2C-negative%2C-%26-zero-formatting)
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
- [Lessons](#lessons)
  - [C# Tips \& Traps](#%5Bc%23-tips-%26-traps%5D)


## String, Character, and Formatting Tips
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

#### Consistent Column Width
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

#### Positive, Negative, & Zero Formatting
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

## Numbers & Dates
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

> Note, `max + 1` is use so the `Next(...)` method will include the max value,  
> otherwise, `max` will be excluded.

Passing a static **seed** value to the `Random` constructor will produce identical  
results when using `Next()` in succession. Two consecutive instances of `Random` will  
most likely produce duplicate values.

- Random objects are not thread safe
- Not completely random, but sufficient for practical purposes
- The same seed value in different **.NET** version is not guaranteed to produce the same results.

```cs

Random random = new(); // System clock is the seed value
int i;

i = random.Next(); // returns non-negative integer
i = random.Next(max + 1); // returns non-negative less than max
i = random.Next(min, max + 1); // returns inclusive value between `min` and `max + 1`

byte[] bytes = random.NextBytes(Byte[] ba); // Creates byte array same size as ba
float float = random.NextFloat(); // 0.0 >= float < 1.0
```

### Creating Cryptographically Secure Random Numbers

```cs
using System.Security.Cryptography;

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
```

### Generating Sequences of Integer Values

```cs
List<int> daysList = new() { 1, 2, 3, 4, 5 };

// Or you can use this:
days = Enumerable.Range(1, 5).ToList();
```

## Data Types and Objects

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

```cs

public struct WithRefType
{
    public int ValueType { get; set; }
    public string ReferenceType { get; set; }

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

## Types for Working With Files, Paths, and URIs
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

## Organizing and Structuring Classes and Code

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
### Using Keywords for Variable Names and Parameters
### Exiting Loops Early

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
|     🔲     | [Data Types and Object Tips]                   | `21:42` |     `50:00` |
|     🔲     | [Tips for Working with Files, Paths, and URIs] | `29:22` |   `1:00:00` |
|     🔲     | [Organizing and Structuring Classes and Code]  | `24:10` |          `` |
|     🔲     | [Compilation Tips]                             | `28:23` |          `` |
|     🔲     | [Tips for Casting and Conversions]             | `20:39` |          `` |
|     🔲     | [Runtime Execution Tips]                       | `27:52` |          `` |
|     🔲     | [Bonus Tips]                                   | `34:51` |          `` |


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
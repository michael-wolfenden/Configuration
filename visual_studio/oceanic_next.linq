<Query Kind="Program">
  <Namespace>System.Drawing</Namespace>
</Query>

void Main()
{
	var base03 = "#1B2B34"; // base03 - background
	var base02 = "#343D46"; // base02 - highlight (selected)
	var base01 = "#4F5B66"; // base01 - comments
	var base00 = "#65737E"; // base00
	var base0 = "#A7ADBA"; // base0 - body text
	var base1 = "#C0C5CE"; // base1
	var base2 = "#CDD3DE"; // base2
	var base3 = "#D8DEE9"; // base3
	var red = "#EC5f67"; // red
	var orange = "#F99157"; // orange
	var yellow = "#FAC863"; // yellow
	var green = "#99C794"; // green
	var aqua = "#5FB3B3"; // agua
	var blue = "#6699CC"; // blue
	var purple = "#C594C5"; // purple
	var brown = "#AB7967"; // brown
	
	var bases = new[] { base03, base02, base01, base00, base0, base1, base2, base3, red, orange, yellow, green, aqua, blue, purple, brown };

	Util.RawHtml(string.Join("<br/>", bases.Select(b => $"<code style=\"background-color: {b};\">{b} - {GenerateBGR(b)} - {GenerateHex(GenerateBGR(b))}</code>").ToArray())).Dump();

	var theme = @"
<?xml version='1.0' encoding='UTF-8'?>
<UserSettings>
    <ApplicationIdentity version='15.0' />
    <ToolsOptions>
        <ToolsOptionsCategory name='Environment' RegisteredName='Environment' />
    </ToolsOptions>
    <Category name='Environment_Group' RegisteredName='Environment_Group'>
        <Category name='Environment_FontsAndColors' Category='{1EDA5DD4-927A-43a7-810E-7FD247D0DA1D}' Package='{DA9FB551-C724-11d0-AE1F-00A0C90FFFC3}' RegisteredName='Environment_FontsAndColors' PackageName='Visual Studio Environment Package'>
            <PropertyValue name='Version'>2</PropertyValue>
            <FontsAndColors Version='2.0'>
                <Theme Id='{A4D6A176-B948-4B29-8C66-53C97A1ED7D0}' />
                <Categories>
                    <Category GUID='{FA937F7B-C0D2-46B8-9F10-A7A92642B384}' FontIsDefault='Yes'>
                        <Items>
                            <Item Name='Artboard Background' Foreground='0x02000000' Background='0x02000000' BoldFont='No' />
                        </Items>
                    </Category>
                    <Category GUID='{58E96763-1D3B-4E05-B6BA-FF7115FD0B7B}' FontName='Fira Code' FontSize='10' CharSet='1' FontIsDefault='No'>
                        <Items>
                            <Item Name='Plain Text' Foreground='[base0]' Background='0x00352B1B' BoldFont='No' />
                            <Item Name='Selected Text' Foreground='0x01000017' Background='[base02]' BoldFont='No' />
                            <Item Name='Inactive Selected Text' Foreground='0x01000017' Background='[base02]' BoldFont='No' />
                            <Item Name='Visible Whitespace' Foreground='[base01]' Background='0x01000018' BoldFont='No' />
                        </Items>
                    </Category>
                    <Category GUID='{E0187991-B458-4F7E-8CA9-42C9A573B56C}' FontName='Fira Code' FontSize='10' CharSet='1' FontIsDefault='No'>
                        <Items>
                            <Item Name='Keyword' Foreground='[purple]' Background='0x01000001' BoldFont='No' />
                            <Item Name='Comment' Foreground='[base01]' Background='0x01000001' BoldFont='No' />
                            <Item Name='String' Foreground='[green]' Background='0x01000001' BoldFont='No' />
                            <Item Name='Number' Foreground='[orange]' Background='0x01000001' BoldFont='No' />
                            <Item Name='Error' Foreground='[red]' Background='0x01000001' BoldFont='No' />
                            <Item Name='XML Keyword' Foreground='[red]' Background='0x01000001' BoldFont='No' />
                            <Item Name='XML Delimiter' Foreground='[aqua]' Background='0x01000001' BoldFont='No' />
                            <Item Name='XML Comment' Foreground='[base01]' Background='0x01000001' BoldFont='No' />
                            <Item Name='XML Name' Foreground='[red]' Background='0x01000001' BoldFont='No' />
                            <Item Name='XML Attribute' Foreground='[purple]' Background='0x01000001' BoldFont='No' />
                            <Item Name='XML Attribute Value' Foreground='[green]' Background='0x01000001' BoldFont='No' />
                            <Item Name='XML Attribute Quotes' Foreground='[green]' Background='0x01000001' BoldFont='No' />
                        </Items>
                    </Category>
                    <Category GUID='{FF349800-EA43-46C1-8C98-878E78F46501}' FontName='Fira Code' FontSize='10' CharSet='1' FontIsDefault='No'>
                        <Items>
                            <Item Name='compiler warning' Foreground='0x006B60EB' Background='0x01000018' BoldFont='No' />
                            <Item Name='Error Message' Foreground='[red]' Background='0x0100000C' BoldFont='No' />
                        </Items>
                    </Category>
                    <Category GUID='{75A05685-00A8-4DED-BAE5-E7A50BFA929A}' FontName='Fira Code' FontSize='10' CharSet='1' FontIsDefault='No'>
                        <Items>
                            <Item Name='ReSharper Current Line Highlight' Foreground='0x01000000' Background='[base2]' BoldFont='No' />
                            <Item Name='ReSharper Warning' Foreground='[red]' Background='0x01000001' BoldFont='Yes' />
                            <Item Name='ReSharper Dead Code' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Suggestion' Foreground='[green]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Hint' Foreground='[green]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Code Analysis Error Marker on Error Stripe' Foreground='[red]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Code Analysis Warning Marker on Error Stripe' Foreground='[yellow]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Code Analysis Suggestion Marker on Error Stripe' Foreground='[green]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Hyperlink' Foreground='[green]' Background='0x01000001' BoldFont='Yes' />
                            <Item Name='ReSharper Context Exit' Foreground='0x01000000' Background='0x00008000' BoldFont='No' />
                            <Item Name='ReSharper Constant Identifier' Foreground='[red]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Event Identifier' Foreground='[purple]' Background='0x01000001' BoldFont='Yes' />
                            <Item Name='ReSharper Field Identifier' Foreground='[aqua]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Method Identifier' Foreground='[blue]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Extension Method Identifier' Foreground='[blue]' Background='0x01000001' BoldFont='Yes' />
                            <Item Name='ReSharper Operator Identifier' Foreground='[purple]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Namespace Identifier' Foreground='[base0]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Late Bound Identifier' Foreground='0x0063C8FF' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Format String Item' Foreground='0x0063C8FF' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Stack Trace Type' Foreground='[yellow]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Stack Trace Hyperlink' Foreground='[yellow]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Class Identifier' Foreground='0x0063C8FF' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Static Class Identifier' Foreground='[red]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Struct Identifier' Foreground='[red]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Enum Identifier' Foreground='[red]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Interface Identifier' Foreground='[orange]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Delegate Identifier' Foreground='[brown]' Background='0x01000001' BoldFont='No' />
                            <Item Name='ReSharper Type Parameter Identifier' Foreground='0x0063C8FF' Background='0x01000001' BoldFont='No' />
                            <Item Name='RoslynActiveStatementTag' Foreground='0x01000000' Background='[base02]' BoldFont='No' />
                            <Item Name='preprocessor text' Foreground='[brown]' Background='0x01000001' BoldFont='No' />
                            <Item Name='punctuation' Foreground='[base0]' Background='0x01000001' BoldFont='No' />
                            <Item Name='string - verbatim' Foreground='[red]' Background='0x01000001' BoldFont='No' />
                            <Item Name='xml doc comment - attribute name' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='xml doc comment - attribute quotes' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='xml doc comment - attribute value' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='xml doc comment - cdata section' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='xml doc comment - comment' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='xml doc comment - delimiter' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='xml doc comment - entity reference' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='xml doc comment - name' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='xml doc comment - processing instruction' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='xml doc comment - text' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='RazorCode' Foreground='[base0]' Background='[base03]' BoldFont='No' />
                            <Item Name='HTML Attribute' Foreground='[purple]' Background='0x01000001' BoldFont='No' />
                            <Item Name='HTML Attribute Value' Foreground='[aqua]' Background='0x01000001' BoldFont='No' />
                            <Item Name='HTML Comment' Foreground='[base01]' Background='0x01000001' BoldFont='No' />
                            <Item Name='HTML Element Name' Foreground='0x006B60EB' Background='0x01000001' BoldFont='No' />
                            <Item Name='HTML Entity' Foreground='0x006B60EB' Background='0x01000001' BoldFont='No' />
                            <Item Name='HTML Operator' Foreground='[aqua]' Background='0x01000001' BoldFont='No' />
                            <Item Name='HTML Server-Side Script' Foreground='[brown]' Background='[base03]' BoldFont='No' />
                            <Item Name='HTML Tag Delimiter' Foreground='[aqua]' Background='0x01000001' BoldFont='No' />
                            <Item Name='Comment' Foreground='[base01]' Background='0x01000001' BoldFont='No' />
                            <Item Name='Keyword' Foreground='[purple]' Background='0x01000001' BoldFont='No' />
                            <Item Name='Preprocessor Keyword' Foreground='[brown]' Background='0x01000001' BoldFont='No' />
                            <Item Name='Operator' Foreground='[base0]' Background='0x01000001' BoldFont='No' />
                            <Item Name='String' Foreground='[green]' Background='0x01000001' BoldFont='No' />
                            <Item Name='Number' Foreground='[orange]' Background='0x01000001' BoldFont='No' />
                            <Item Name='Block Structure Adornments' Foreground='0x01000000' Background='[base01]' BoldFont='No' />
                            <Item Name='compiler warning' Foreground='0x006B60EB' Background='0x01000001' BoldFont='No' />
                            <Item Name='Visible Whitespace' Foreground='[base01]' Background='0x01000001' BoldFont='No' />
                            <Item Name='Selected Text' Foreground='0x01000000' Background='[base02]' BoldFont='No' />
                            <Item Name='Inactive Selected Text' Foreground='0x01000000' Background='[base02]' BoldFont='No' />
                            <Item Name='urlformat' Foreground='0x0063C8FF' Background='0x01000001' BoldFont='No' />
                            <Item Name='XML Doc Comment' Foreground='[base00]' Background='0x01000001' BoldFont='No' />
                            <Item Name='XML Doc Tag' Foreground='0x006B60EB' Background='0x01000001' BoldFont='No' />
                            <Item Name='MarkerFormatDefinition/ScopeHighlight' Foreground='0x00F7EBE7' Background='[base01]' BoldFont='No' />
                        </Items>
                    </Category>
                    <Category GUID='{B36B0228-DBAD-4DB0-B9C7-2AD3E572010F}' FontName='Segoe UI' FontSize='9' CharSet='1' FontIsDefault='No'>
                        <Items>
                            <Item Name='Different content' Foreground='0x000014E5' Background='0x00FFFFFF' BoldFont='No' />
                            <Item Name='Identical content' Foreground='0x00000000' Background='0x00FFFFFF' BoldFont='No' />
                            <Item Name='Source Only' Foreground='0x00000000' Background='0x00FFFFFF' BoldFont='No' />
                            <Item Name='Target Only' Foreground='0x00000000' Background='0x00FFFFFF' BoldFont='No' />
                            <Item Name='Not Downloaded' Foreground='0x006D6D6D' Background='0x00FFFFFF' BoldFont='No' />
                            <Item Name='Even Row Items' Foreground='0x00000000' Background='0x00FFFFFF' BoldFont='No' />
                            <Item Name='Odd Row Items' Foreground='0x00000000' Background='0x00FFFFFF' BoldFont='No' />
                        </Items>
                    </Category>
                </Categories>
            </FontsAndColors>
        </Category>
    </Category>
</UserSettings>
".Trim().Replace("'", "\"");

	var items = XDocument
		.Parse(theme)
		.Descendants("Item")
		.OrderBy(xd => xd.Attribute("Name").Value)
		.Select(xd =>
			$"<code style=\"background-color: {GenerateHex(xd.Attribute("Background").Value)};color: {GenerateHex(xd.Attribute("Foreground").Value)}\"> {xd.Attribute("Name").Value}</code>"
		)
		.ToArray();

	Util.RawHtml(string.Join("<br/>", items)).Dump();

	var updatedTheme = theme;
	updatedTheme = updatedTheme.Replace("[base03]", GenerateBGR(base03));
	updatedTheme = updatedTheme.Replace("[base02]", GenerateBGR(base02));
	updatedTheme = updatedTheme.Replace("[base01]", GenerateBGR(base01));
	updatedTheme = updatedTheme.Replace("[base00]", GenerateBGR(base00));
	updatedTheme = updatedTheme.Replace("[base0]", GenerateBGR(base0));
	updatedTheme = updatedTheme.Replace("[base1]", GenerateBGR(base1));
	updatedTheme = updatedTheme.Replace("[base2]", GenerateBGR(base2));
	updatedTheme = updatedTheme.Replace("[base3]", GenerateBGR(base3));
	updatedTheme = updatedTheme.Replace("[red]", GenerateBGR(red));
	updatedTheme = updatedTheme.Replace("[orange]", GenerateBGR(orange));
	updatedTheme = updatedTheme.Replace("[yellow]", GenerateBGR(yellow));
	updatedTheme = updatedTheme.Replace("[green]", GenerateBGR(green));
	updatedTheme = updatedTheme.Replace("[aqua]", GenerateBGR(aqua));
	updatedTheme = updatedTheme.Replace("[blue]", GenerateBGR(blue));
	updatedTheme = updatedTheme.Replace("[purple]", GenerateBGR(purple));
	updatedTheme = updatedTheme.Replace("[brown]", GenerateBGR(brown));
	
	updatedTheme.Dump();
}

public string GenerateBGR(string hex)
{
	var r = hex.Substring(1,2);
	var g = hex.Substring(3,2);
	var b = hex.Substring(5,2);
	
	return $"0x00{b}{g}{r}";
}

public string GenerateHex(string bgr)
{
	if (bgr == "[base03]") return "#1B2B34"; // base03 - background
	if (bgr == "[base02]") return "#343D46"; // base02 - highlight (selected)
	if (bgr == "[base01]") return "#4F5B66"; // base01 - comments
	if (bgr == "[base00]") return "#65737E"; // base00
	if (bgr == "[base0]") return "#A7ADBA"; // base0 - body text
	if (bgr == "[base1]") return "#C0C5CE"; // base1
	if (bgr == "[base2]") return "#CDD3DE"; // base2
	if (bgr == "[base3]") return "#D8DEE9"; // base3
	if (bgr == "[red]") return "#EC5f67"; // red
	if (bgr == "[orange]") return "#F99157"; // orange
	if (bgr == "[yellow]") return "#FAC863"; // yellow
	if (bgr == "[green]") return "#99C794"; // green
	if (bgr == "[aqua]") return "#5FB3B3"; // agua
	if (bgr == "[blue]") return "#6699CC"; // blue
	if (bgr == "[purple]") return "#C594C5"; // purple
	if (bgr == "[brown]") return "#AB7967"; // brown

	var bgrWithoutPrefix = bgr.Substring(4);
	
	var r = bgrWithoutPrefix.Substring(4, 2);
	var g = bgrWithoutPrefix.Substring(2, 2);
	var b = bgrWithoutPrefix.Substring(0, 2);

	return $"#{r}{g}{b}";
}
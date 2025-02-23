[Exposed=Window]
interface HTMLFontElement : HTMLElement {
  [HTMLConstructor] constructor();

  [CEReactions] attribute [LegacyNullToEmptyString] DOMString color;
  [CEReactions] attribute DOMString face;
  [CEReactions] attribute DOMString size; 
};
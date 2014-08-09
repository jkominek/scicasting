(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 10.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[     10524,        262]
NotebookOptionsPosition[     11019,        255]
NotebookOutlinePosition[     11454,        274]
CellTagsIndexPosition[     11411,        271]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"tradeto", "=", 
       RowBox[{"tradeto", "/.", 
        RowBox[{"Last", "[", 
         RowBox[{"NMaximize", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"If", "[", 
              RowBox[{
               RowBox[{
                RowBox[{
                 RowBox[{
                  RowBox[{"yesCost", "[", 
                   RowBox[{"start", ",", "tradeto"}], "]"}], "+", "bankroll", 
                  "+", "yesAssets"}], ">", "0"}], "&&", 
                RowBox[{
                 RowBox[{
                  RowBox[{"noCost", "[", 
                   RowBox[{"start", ",", "tradeto"}], "]"}], "+", "bankroll", 
                  "+", "noAssets"}], ">", "0"}]}], ",", 
               RowBox[{
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"belief", "/", "100"}], ")"}], "*", 
                 RowBox[{"Log", "[", 
                  RowBox[{
                   RowBox[{"yesCost", "[", 
                    RowBox[{"start", ",", "tradeto"}], "]"}], "+", "bankroll",
                    "+", "yesAssets"}], "]"}]}], "+", 
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"1", "-", 
                   RowBox[{"(", 
                    RowBox[{"belief", "/", "100"}], ")"}]}], ")"}], "*", 
                 RowBox[{"Log", "[", 
                  RowBox[{
                   RowBox[{"noCost", "[", 
                    RowBox[{"start", ",", "tradeto"}], "]"}], "+", "bankroll",
                    "+", "noAssets"}], "]"}]}]}], ",", "\[IndentingNewLine]", 
               RowBox[{"-", 
                RowBox[{"(", 
                 RowBox[{"10", "^", "1000"}], ")"}]}]}], "]"}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"(", 
              RowBox[{"1", "\[LessEqual]", "tradeto", "<", "99"}], ")"}]}], 
            "\[IndentingNewLine]", "}"}], ",", "tradeto"}], "]"}], "]"}]}]}], 
      "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{"Grid", "[", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"\"\<Trade to:\>\"", ",", 
          RowBox[{"Round", "[", "tradeto", "]"}]}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"\"\<Potential winnings:\>\"", ",", 
          RowBox[{"N", "[", 
           RowBox[{"Max", "[", 
            RowBox[{
             RowBox[{"yesCost", "[", 
              RowBox[{"start", ",", 
               RowBox[{"Round", "[", "tradeto", "]"}]}], "]"}], ",", 
             RowBox[{"noCost", "[", 
              RowBox[{"start", ",", 
               RowBox[{"Round", "[", "tradeto", "]"}]}], "]"}]}], "]"}], 
           "]"}]}], "}"}], ",", "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"\"\<Cost:\>\"", ",", 
          RowBox[{"N", "[", 
           RowBox[{"cost", "[", 
            RowBox[{"start", ",", 
             RowBox[{"Round", "[", "tradeto", "]"}]}], "]"}], "]"}]}], 
         "}"}]}], "}"}], "]"}]}], "]"}], ",", "\n", "  ", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"start", ",", "40"}], "}"}], ",", "0.5", ",", "99.5", ",", 
     "0.5", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", "\n",
    "  ", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"belief", ",", "60"}], "}"}], ",", "0.5", ",", "99.5", ",", 
     "0.5", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"bankroll", ",", "500"}], "}"}], ",", "10", ",", "1000", ",", 
     "5", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   "\[IndentingNewLine]", "\"\<Assets you already have\>\"", ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"yesAssets", ",", "0"}], "}"}], ",", 
     RowBox[{"-", "500"}], ",", "500", ",", "5", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"noAssets", ",", "0"}], "}"}], ",", 
     RowBox[{"-", "500"}], ",", "500", ",", "5", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", "\n", 
   RowBox[{"SaveDefinitions", "->", "True"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`bankroll$$ = 500, $CellContext`belief$$ = 
    60, $CellContext`noAssets$$ = 0, $CellContext`start$$ = 
    40, $CellContext`yesAssets$$ = 0, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`start$$], 40}, 0.5, 99.5, 0.5}, {{
       Hold[$CellContext`belief$$], 60}, 0.5, 99.5, 0.5}, {{
       Hold[$CellContext`bankroll$$], 500}, 10, 1000, 5}, {
      Hold["Assets you already have"], Manipulate`Dump`ThisIsNotAControl}, {{
       Hold[$CellContext`yesAssets$$], 0}, -500, 500, 5}, {{
       Hold[$CellContext`noAssets$$], 0}, -500, 500, 5}}, Typeset`size$$ = {
    226., {16.5, 23.5}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False, $CellContext`start$720564$$ = 
    0, $CellContext`belief$720565$$ = 0, $CellContext`bankroll$720566$$ = 
    0, $CellContext`yesAssets$720567$$ = 0, $CellContext`noAssets$720568$$ = 
    0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`bankroll$$ = 500, $CellContext`belief$$ = 
        60, $CellContext`noAssets$$ = 0, $CellContext`start$$ = 
        40, $CellContext`yesAssets$$ = 0}, "ControllerVariables" :> {
        Hold[$CellContext`start$$, $CellContext`start$720564$$, 0], 
        Hold[$CellContext`belief$$, $CellContext`belief$720565$$, 0], 
        Hold[$CellContext`bankroll$$, $CellContext`bankroll$720566$$, 0], 
        Hold[$CellContext`yesAssets$$, $CellContext`yesAssets$720567$$, 0], 
        Hold[$CellContext`noAssets$$, $CellContext`noAssets$720568$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      With[{$CellContext`tradeto$ = ReplaceAll[$CellContext`tradeto, 
           Last[
            NMaximize[{
              If[
               
               And[$CellContext`yesCost[$CellContext`start$$, \
$CellContext`tradeto] + $CellContext`bankroll$$ + $CellContext`yesAssets$$ > 
                0, $CellContext`noCost[$CellContext`start$$, \
$CellContext`tradeto] + $CellContext`bankroll$$ + $CellContext`noAssets$$ > 
                0], ($CellContext`belief$$/100) 
                Log[$CellContext`yesCost[$CellContext`start$$, \
$CellContext`tradeto] + $CellContext`bankroll$$ + $CellContext`yesAssets$$] + \
(1 - $CellContext`belief$$/100) 
                Log[$CellContext`noCost[$CellContext`start$$, \
$CellContext`tradeto] + $CellContext`bankroll$$ + $CellContext`noAssets$$], \
-10^1000], 
              Inequality[
              1, LessEqual, $CellContext`tradeto, Less, 
               99]}, $CellContext`tradeto]]]}, 
        Grid[{{"Trade to:", 
           Round[$CellContext`tradeto$]}, {"Potential winnings:", 
           N[
            Max[
             $CellContext`yesCost[$CellContext`start$$, 
              Round[$CellContext`tradeto$]], 
             $CellContext`noCost[$CellContext`start$$, 
              Round[$CellContext`tradeto$]]]]}, {"Cost:", 
           N[
            $CellContext`cost[$CellContext`start$$, 
             Round[$CellContext`tradeto$]]]}}]], 
      "Specifications" :> {{{$CellContext`start$$, 40}, 0.5, 99.5, 0.5, 
         Appearance -> "Labeled"}, {{$CellContext`belief$$, 60}, 0.5, 99.5, 
         0.5, Appearance -> "Labeled"}, {{$CellContext`bankroll$$, 500}, 10, 
         1000, 5, Appearance -> "Labeled"}, 
        "Assets you already have", {{$CellContext`yesAssets$$, 0}, -500, 500, 
         5, Appearance -> "Labeled"}, {{$CellContext`noAssets$$, 0}, -500, 
         500, 5, Appearance -> "Labeled"}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{346., {125., 132.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({$CellContext`yesCost[
         Pattern[$CellContext`i, 
          Blank[]], 
         Pattern[$CellContext`t, 
          Blank[]]] := 
       100 Log[2, $CellContext`t/$CellContext`i], $CellContext`noCost[
         Pattern[$CellContext`i, 
          Blank[]], 
         Pattern[$CellContext`t, 
          Blank[]]] := 
       100 Log[2, (100 - $CellContext`t)/(
          100 - $CellContext`i)], $CellContext`cost[
         Pattern[$CellContext`start, 
          Blank[]], 
         Pattern[$CellContext`target, 
          Blank[]]] := Min[
         $CellContext`yesCost[$CellContext`start, $CellContext`target], 
         $CellContext`noCost[$CellContext`start, $CellContext`target]]}; 
     Typeset`initDone$$ = True),
    SynchronousInitialization->True,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output"]
}, Open  ]]
},
WindowSize->{1610, 1067},
Visible->True,
ScrollingOptions->{"VerticalScrollRange"->Fit},
ShowCellBracket->Automatic,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"10.0 for Microsoft Windows (64-bit) (July 1, 2014)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 4451, 114, 392, "Input"],
Cell[5940, 151, 5063, 101, 274, "Output"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature gv0aU7FjJpj7dB1S07u99xJU *)

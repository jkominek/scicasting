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
NotebookDataLength[     19753,        464]
NotebookOptionsPosition[     20246,        457]
NotebookOutlinePosition[     20681,        476]
CellTagsIndexPosition[     20638,        473]
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
     RowBox[{"Column", "[", 
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"Grid", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"\"\<Trade to:\>\"", ",", 
             RowBox[{"StringJoin", "[", 
              RowBox[{
               RowBox[{"ToString", "[", 
                RowBox[{"Round", "[", "tradeto", "]"}], "]"}], ",", 
               "\"\<%\>\""}], "]"}]}], "}"}], ",", 
           RowBox[{"{", "}"}], ",", "\[IndentingNewLine]", 
           RowBox[{"{", 
            RowBox[{
            "\"\<New Assets\>\"", ",", "\"\<\>\"", ",", 
             "\"\<Final Assets\>\""}], "}"}], ",", "\[IndentingNewLine]", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"tinyRound", "[", 
              RowBox[{"yesCost", "[", 
               RowBox[{"start", ",", 
                RowBox[{"Round", "[", "tradeto", "]"}]}], "]"}], "]"}], ",", 
             "\[IndentingNewLine]", "\"\<Yes\>\"", ",", 
             RowBox[{"tinyRound", "[", 
              RowBox[{
               RowBox[{"yesCost", "[", 
                RowBox[{"start", ",", 
                 RowBox[{"Round", "[", "tradeto", "]"}]}], "]"}], "+", 
               "yesAssets"}], "]"}]}], "}"}], ",", "\[IndentingNewLine]", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"tinyRound", "[", 
              RowBox[{"noCost", "[", 
               RowBox[{"start", ",", 
                RowBox[{"Round", "[", "tradeto", "]"}]}], "]"}], "]"}], ",", 
             "\[IndentingNewLine]", "\"\<No\>\"", ",", 
             RowBox[{"tinyRound", "[", 
              RowBox[{
               RowBox[{"noCost", "[", 
                RowBox[{"start", ",", 
                 RowBox[{"Round", "[", "tradeto", "]"}]}], "]"}], "+", 
               "noAssets"}], "]"}]}], "}"}]}], "}"}], "]"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"Plot", "[", 
         RowBox[{
          RowBox[{"expectedOutcome", "[", 
           RowBox[{
           "start", ",", "belief", ",", "target", ",", "noAssets", ",", 
            "yesAssets"}], "]"}], ",", "\[IndentingNewLine]", 
          RowBox[{"{", 
           RowBox[{"target", ",", "0.5", ",", "99.5"}], "}"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"ImageSize", "\[Rule]", "Large"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"ColorFunctionScaling", "\[Rule]", "False"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"AxesLabel", "\[Rule]", 
           RowBox[{"{", 
            RowBox[{"\"\<%\>\"", ",", "\"\<E[Earnings after trade]\>\""}], 
            "}"}]}], ",", "\[IndentingNewLine]", 
          RowBox[{"PlotRange", "\[Rule]", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"0", ",", "100"}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{
               RowBox[{"-", "100"}], ",", 
               RowBox[{"50", "+", 
                RowBox[{"expectedOutcome", "[", 
                 RowBox[{
                 "start", ",", "belief", ",", "belief", ",", "noAssets", ",", 
                  "yesAssets"}], "]"}]}]}], "}"}]}], "}"}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"ColorFunction", "\[Rule]", 
           RowBox[{"Function", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"x", ",", "y"}], "}"}], ",", 
             RowBox[{"If", "[", 
              RowBox[{
               RowBox[{"y", ">", "0"}], ",", "Blue", ",", "Orange"}], "]"}]}],
             "]"}]}], ",", "\[IndentingNewLine]", 
          RowBox[{"GridLines", "\[Rule]", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"start", ",", "belief", ",", "tradeto"}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"expectedOutcome", "[", 
               RowBox[{
               "start", ",", "belief", ",", "belief", ",", "noAssets", ",", 
                "yesAssets"}], "]"}], "}"}]}], "}"}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"Ticks", "\[Rule]", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{
              "0", ",", "10", ",", "25", ",", "50", ",", "75", ",", "90", ",",
                "100", ",", 
               RowBox[{"{", 
                RowBox[{"start", ",", "\"\<S\>\""}], "}"}], ",", 
               RowBox[{"{", 
                RowBox[{"tradeto", ",", "\"\<T\>\""}], "}"}], ",", 
               RowBox[{"{", 
                RowBox[{"belief", ",", "\"\<B\>\""}], "}"}]}], "}"}], ",", 
             "Automatic"}], "}"}]}], ",", 
          RowBox[{"Epilog", "\[Rule]", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"Text", "[", 
              RowBox[{
               RowBox[{"Round", "[", 
                RowBox[{"expectedOutcome", "[", 
                 RowBox[{
                 "start", ",", "belief", ",", "belief", ",", "noAssets", ",", 
                  "yesAssets"}], "]"}], "]"}], ",", "\[IndentingNewLine]", 
               "                         ", 
               RowBox[{"{", 
                RowBox[{"belief", ",", 
                 RowBox[{"expectedOutcome", "[", 
                  RowBox[{
                  "start", ",", "belief", ",", "belief", ",", "noAssets", ",",
                    "yesAssets"}], "]"}]}], "}"}], ",", "\[IndentingNewLine]",
                "                         ", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"If", "[", 
                  RowBox[{
                   RowBox[{"belief", "<", "tradeto"}], ",", "Right", ",", 
                   "Left"}], "]"}], ",", "Bottom"}], "}"}]}], "]"}], ",", 
             "\[IndentingNewLine]", "                ", 
             RowBox[{"Text", "[", 
              RowBox[{
               RowBox[{"Round", "[", 
                RowBox[{"expectedOutcome", "[", 
                 RowBox[{
                 "start", ",", "belief", ",", "tradeto", ",", "noAssets", ",",
                   "yesAssets"}], "]"}], "]"}], ",", "\[IndentingNewLine]", 
               "                         ", 
               RowBox[{"{", 
                RowBox[{"tradeto", ",", 
                 RowBox[{"expectedOutcome", "[", 
                  RowBox[{
                  "start", ",", "belief", ",", "tradeto", ",", "noAssets", 
                   ",", "yesAssets"}], "]"}]}], "}"}], ",", 
               "\[IndentingNewLine]", "                         ", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"If", "[", 
                  RowBox[{
                   RowBox[{"belief", "<", "tradeto"}], ",", "Left", ",", 
                   "Right"}], "]"}], ",", "Bottom"}], "}"}]}], "]"}]}], 
            "}"}]}]}], "]"}]}], "}"}], "]"}]}], "]"}], ",", "\n", "  ", 
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
   DynamicModuleBox[{$CellContext`bankroll$$ = 70, $CellContext`belief$$ = 
    60, $CellContext`noAssets$$ = 130, $CellContext`start$$ = 
    40, $CellContext`yesAssets$$ = -155, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`start$$], 40}, 0.5, 99.5, 0.5}, {{
       Hold[$CellContext`belief$$], 60}, 0.5, 99.5, 0.5}, {{
       Hold[$CellContext`bankroll$$], 500}, 10, 1000, 5}, {
      Hold["Assets you already have"], Manipulate`Dump`ThisIsNotAControl}, {{
       Hold[$CellContext`yesAssets$$], 0}, -500, 500, 5}, {{
       Hold[$CellContext`noAssets$$], 0}, -500, 500, 5}}, Typeset`size$$ = {
    576., {204., 211.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False, $CellContext`start$802335$$ = 
    0, $CellContext`belief$802336$$ = 0, $CellContext`bankroll$802337$$ = 
    0, $CellContext`yesAssets$802338$$ = 0, $CellContext`noAssets$802339$$ = 
    0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`bankroll$$ = 500, $CellContext`belief$$ = 
        60, $CellContext`noAssets$$ = 0, $CellContext`start$$ = 
        40, $CellContext`yesAssets$$ = 0}, "ControllerVariables" :> {
        Hold[$CellContext`start$$, $CellContext`start$802335$$, 0], 
        Hold[$CellContext`belief$$, $CellContext`belief$802336$$, 0], 
        Hold[$CellContext`bankroll$$, $CellContext`bankroll$802337$$, 0], 
        Hold[$CellContext`yesAssets$$, $CellContext`yesAssets$802338$$, 0], 
        Hold[$CellContext`noAssets$$, $CellContext`noAssets$802339$$, 0]}, 
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
        Column[{
          Grid[{{"Trade to:", 
             StringJoin[
              ToString[
               Round[$CellContext`tradeto$]], "%"]}, {}, {
            "New Assets", "", "Final Assets"}, {
             $CellContext`tinyRound[
              $CellContext`yesCost[$CellContext`start$$, 
               Round[$CellContext`tradeto$]]], "Yes", 
             $CellContext`tinyRound[$CellContext`yesCost[$CellContext`start$$, 
                Round[$CellContext`tradeto$]] + $CellContext`yesAssets$$]}, {
             $CellContext`tinyRound[
              $CellContext`noCost[$CellContext`start$$, 
               Round[$CellContext`tradeto$]]], "No", 
             $CellContext`tinyRound[$CellContext`noCost[$CellContext`start$$, 
                Round[$CellContext`tradeto$]] + $CellContext`noAssets$$]}}], 
          Plot[
           $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`target, $CellContext`noAssets$$, \
$CellContext`yesAssets$$], {$CellContext`target, 0.5, 99.5}, ImageSize -> 
           Large, ColorFunctionScaling -> False, 
           AxesLabel -> {"%", "E[Earnings after trade]"}, 
           PlotRange -> {{0, 
             100}, {-100, 
              50 + $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`belief$$, $CellContext`noAssets$$, \
$CellContext`yesAssets$$]}}, ColorFunction -> 
           Function[{$CellContext`x, $CellContext`y}, 
             If[$CellContext`y > 0, Blue, Orange]], 
           GridLines -> {{$CellContext`start$$, $CellContext`belief$$, \
$CellContext`tradeto$}, {
              $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`belief$$, $CellContext`noAssets$$, \
$CellContext`yesAssets$$]}}, 
           Ticks -> {{
             0, 10, 25, 50, 75, 90, 
              100, {$CellContext`start$$, "S"}, {$CellContext`tradeto$, 
               "T"}, {$CellContext`belief$$, "B"}}, Automatic}, Epilog -> {
             Text[
              Round[
               $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`belief$$, $CellContext`noAssets$$, \
$CellContext`yesAssets$$]], {$CellContext`belief$$, 
               $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`belief$$, $CellContext`noAssets$$, \
$CellContext`yesAssets$$]}, {
               If[$CellContext`belief$$ < $CellContext`tradeto$, Right, Left],
                Bottom}], 
             Text[
              Round[
               $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`tradeto$, $CellContext`noAssets$$, \
$CellContext`yesAssets$$]], {$CellContext`tradeto$, 
               $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`tradeto$, $CellContext`noAssets$$, \
$CellContext`yesAssets$$]}, {
               If[$CellContext`belief$$ < $CellContext`tradeto$, Left, Right],
                Bottom}]}]}]], 
      "Specifications" :> {{{$CellContext`start$$, 40}, 0.5, 99.5, 0.5, 
         Appearance -> "Labeled"}, {{$CellContext`belief$$, 60}, 0.5, 99.5, 
         0.5, Appearance -> "Labeled"}, {{$CellContext`bankroll$$, 500}, 10, 
         1000, 5, Appearance -> "Labeled"}, 
        "Assets you already have", {{$CellContext`yesAssets$$, 0}, -500, 500, 
         5, Appearance -> "Labeled"}, {{$CellContext`noAssets$$, 0}, -500, 
         500, 5, Appearance -> "Labeled"}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{627., {312., 319.}},
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
          100 - $CellContext`i)], $CellContext`tinyRound[
         Pattern[$CellContext`v, 
          Blank[]]] := Round[$CellContext`v, 
         If[
          And[Abs[$CellContext`v] < 1, $CellContext`v != 0], 0.1, 
          1]], $CellContext`expectedOutcome[
         Pattern[$CellContext`i, 
          Blank[]], 
         Pattern[$CellContext`b, 
          Blank[]], 
         Pattern[$CellContext`t, 
          Blank[]]] := ($CellContext`b/
          100) $CellContext`yesCost[$CellContext`i, $CellContext`t] + (
          1 - $CellContext`b/
          100) $CellContext`noCost[$CellContext`i, $CellContext`t], \
$CellContext`expectedOutcome[
         Pattern[$CellContext`i, 
          Blank[]], 
         Pattern[$CellContext`b, 
          Blank[]], 
         Pattern[$CellContext`t, 
          Blank[]], 
         Optional[
          Pattern[$CellContext`neg, 
           Blank[]], 0], 
         Optional[
          Pattern[$CellContext`pos, 
           Blank[]], 0]] := ($CellContext`b/
          100) ($CellContext`pos + $CellContext`yesCost[$CellContext`i, \
$CellContext`t]) + (1 - $CellContext`b/
          100) ($CellContext`neg + $CellContext`noCost[$CellContext`i, \
$CellContext`t])}; Typeset`initDone$$ = True),
    SynchronousInitialization->True,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output"]
}, Open  ]]
},
WindowSize->{1452, 1157},
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
Cell[1486, 35, 10249, 245, 772, "Input"],
Cell[11738, 282, 8492, 172, 648, "Output"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature LvDDWBposqek#AgQWaTgbqOq *)

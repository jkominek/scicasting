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
NotebookDataLength[     12051,        305]
NotebookOptionsPosition[     12546,        298]
NotebookOutlinePosition[     12981,        317]
CellTagsIndexPosition[     12938,        314]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[BoxData[
 RowBox[{"Manipulate", "[", "\n", "  ", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"TVyesCost", "[", 
        RowBox[{
        "start", ",", "target", ",", "annualRate", ",", 
         "monthsToResolution"}], "]"}], ",", "\n", "       ", 
       RowBox[{"TVnoCost", "[", 
        RowBox[{
        "start", ",", "target", ",", "annualRate", ",", 
         "monthsToResolution"}], "]"}]}], "}"}], ",", "\n", "       ", 
     RowBox[{"{", 
      RowBox[{"target", ",", "0.5", ",", "99.5"}], "}"}], ",", "\n", 
     "       ", 
     RowBox[{"ImageSize", "\[Rule]", "Large"}], ",", "\n", "       ", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<%\>\"", ",", "Points"}], "}"}]}], ",", "\n", "       ", 
     RowBox[{"PerformanceGoal", "\[Rule]", "\"\<Speed\>\""}], ",", "\n", 
     "       ", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"Green", ",", "Red"}], "}"}]}], ",", "\n", "       ", 
     RowBox[{"PlotRange", "->", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"0", ",", "100"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"-", "500"}], ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
     "\n", "       ", 
     RowBox[{"GridLines", " ", "->", " ", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"start", ",", "tradeto", ",", 
          RowBox[{"100", "-", "start"}]}], "}"}], ",", 
        RowBox[{"{", "}"}]}], "}"}]}], ",", "\n", "       ", 
     RowBox[{"Ticks", " ", "->", " ", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
         "0", ",", "10", ",", "25", ",", "50", ",", "75", ",", "90", ",", 
          "100", ",", 
          RowBox[{"{", 
           RowBox[{"start", ",", "S"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"tradeto", ",", "T"}], "}"}]}], "}"}], ",", "Automatic"}], 
       "}"}]}], ",", "\n", "       ", 
     RowBox[{"Epilog", "->", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Text", "[", 
         RowBox[{
          RowBox[{"Round", "[", 
           RowBox[{"TVyesCost", "[", 
            RowBox[{
            "start", ",", "tradeto", ",", "annualRate", ",", 
             "monthsToResolution"}], "]"}], "]"}], ",", "\n", 
          "                     ", 
          RowBox[{"{", 
           RowBox[{"tradeto", ",", 
            RowBox[{"TVyesCost", "[", 
             RowBox[{
             "start", ",", "tradeto", ",", "annualRate", ",", 
              "monthsToResolution"}], "]"}]}], "}"}], ",", 
          "\[IndentingNewLine]", "         ", 
          RowBox[{"{", 
           RowBox[{"Center", ",", 
            RowBox[{"If", "[", 
             RowBox[{
              RowBox[{"start", "<", "tradeto"}], ",", "Bottom", ",", "Top"}], 
             "]"}]}], "}"}]}], "]"}], ",", "\n", "                ", 
        RowBox[{"Text", "[", 
         RowBox[{
          RowBox[{"Round", "[", 
           RowBox[{"TVnoCost", "[", 
            RowBox[{
            "start", ",", "tradeto", ",", "annualRate", ",", 
             "monthsToResolution"}], "]"}], "]"}], ",", "\n", 
          "                     ", 
          RowBox[{"{", 
           RowBox[{"tradeto", ",", 
            RowBox[{"TVnoCost", "[", 
             RowBox[{
             "start", ",", "tradeto", ",", "annualRate", ",", 
              "monthsToResolution"}], "]"}]}], "}"}], ",", 
          "\[IndentingNewLine]", "         ", 
          RowBox[{"{", 
           RowBox[{"Center", ",", 
            RowBox[{"If", "[", 
             RowBox[{
              RowBox[{"start", ">", "tradeto"}], ",", "Bottom", ",", "Top"}], 
             "]"}]}], "}"}]}], "]"}]}], "\n", "               ", "}"}]}]}], 
    "\n", "       ", "]"}], ",", "\n", "  ", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"start", ",", 
       RowBox[{"N", "[", "33.3", "]"}]}], "}"}], ",", "0.5", ",", "99.5", ",",
      "0.5", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", "\n",
    "  ", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"tradeto", ",", 
       RowBox[{"N", "[", "66.6", "]"}]}], "}"}], ",", "0.5", ",", "99.5", ",",
      "0.5", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"annualRate", ",", 
       RowBox[{"N", "[", "10", "]"}]}], "}"}], ",", "0.1", ",", "20", ",", 
     "0.1", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"monthsToResolution", ",", "2"}], "}"}], ",", "0", ",", "48", 
     ",", 
     RowBox[{
      RowBox[{"1", "Appearance"}], "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], 
   ",", "\n", "  ", 
   RowBox[{"SaveDefinitions", " ", "->", " ", "True"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`annualRate$$ = 
    10., $CellContext`monthsToResolution$$ = 0., $CellContext`start$$ = 
    33.3, $CellContext`tradeto$$ = 66.6, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`start$$], 33.3}, 0.5, 99.5, 0.5}, {{
       Hold[$CellContext`tradeto$$], 66.6}, 0.5, 99.5, 0.5}, {{
       Hold[$CellContext`annualRate$$], 10.}, 0.1, 20, 0.1}, {{
       Hold[$CellContext`monthsToResolution$$], 2}, 0, 48}}, 
    Typeset`size$$ = {576., {175., 179.}}, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = 
    False, $CellContext`start$185437$$ = 0, $CellContext`tradeto$185438$$ = 
    0, $CellContext`annualRate$185439$$ = 
    0, $CellContext`monthsToResolution$185440$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`annualRate$$ = 
        10., $CellContext`monthsToResolution$$ = 2, $CellContext`start$$ = 
        33.3, $CellContext`tradeto$$ = 66.6}, "ControllerVariables" :> {
        Hold[$CellContext`start$$, $CellContext`start$185437$$, 0], 
        Hold[$CellContext`tradeto$$, $CellContext`tradeto$185438$$, 0], 
        Hold[$CellContext`annualRate$$, $CellContext`annualRate$185439$$, 0], 
        Hold[$CellContext`monthsToResolution$$, \
$CellContext`monthsToResolution$185440$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> Plot[{
         $CellContext`TVyesCost[$CellContext`start$$, $CellContext`target, \
$CellContext`annualRate$$, $CellContext`monthsToResolution$$], 
         $CellContext`TVnoCost[$CellContext`start$$, $CellContext`target, \
$CellContext`annualRate$$, $CellContext`monthsToResolution$$]}, \
{$CellContext`target, 0.5, 99.5}, ImageSize -> Large, 
        AxesLabel -> {"%", $CellContext`Points}, PerformanceGoal -> "Speed", 
        PlotStyle -> {Green, Red}, PlotRange -> {{0, 100}, {-500, Automatic}},
         GridLines -> {{$CellContext`start$$, $CellContext`tradeto$$, 
           100 - $CellContext`start$$}, {}}, 
        Ticks -> {{
          0, 10, 25, 50, 75, 90, 
           100, {$CellContext`start$$, $CellContext`S}, \
{$CellContext`tradeto$$, $CellContext`T}}, Automatic}, Epilog -> {
          Text[
           Round[
            $CellContext`TVyesCost[$CellContext`start$$, \
$CellContext`tradeto$$, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$]], {$CellContext`tradeto$$, 
            $CellContext`TVyesCost[$CellContext`start$$, \
$CellContext`tradeto$$, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$]}, {Center, 
            If[$CellContext`start$$ < $CellContext`tradeto$$, Bottom, Top]}], 
          Text[
           Round[
            $CellContext`TVnoCost[$CellContext`start$$, \
$CellContext`tradeto$$, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$]], {$CellContext`tradeto$$, 
            $CellContext`TVnoCost[$CellContext`start$$, \
$CellContext`tradeto$$, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$]}, {Center, 
            
            If[$CellContext`start$$ > $CellContext`tradeto$$, Bottom, 
             Top]}]}], 
      "Specifications" :> {{{$CellContext`start$$, 33.3}, 0.5, 99.5, 0.5, 
         Appearance -> "Labeled"}, {{$CellContext`tradeto$$, 66.6}, 0.5, 99.5,
          0.5, Appearance -> "Labeled"}, {{$CellContext`annualRate$$, 10.}, 
         0.1, 20, 0.1, Appearance -> 
         "Labeled"}, {{$CellContext`monthsToResolution$$, 2}, 0, 48, 
         Appearance -> "Labeled"}}, "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{627., {261., 268.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({$CellContext`TVyesCost[
         Pattern[$CellContext`start, 
          Blank[]], 
         Pattern[$CellContext`target, 
          Blank[]], 
         Pattern[$CellContext`annualRate, 
          Blank[]], 
         Pattern[$CellContext`monthsToResolution, 
          Blank[]]] := 
       If[$CellContext`yesCost[$CellContext`start, $CellContext`target] > 0, 
         TimeValue[
          $CellContext`yesCost[$CellContext`start, $CellContext`target], 
          
          EffectiveInterest[$CellContext`annualRate/100, 1/
           12], -$CellContext`monthsToResolution], 
         $CellContext`yesCost[$CellContext`start, $CellContext`target]], \
$CellContext`yesCost[
         Pattern[$CellContext`i, 
          Blank[]], 
         Pattern[$CellContext`t, 
          Blank[]]] := 
       100 Log[2, $CellContext`t/$CellContext`i], $CellContext`TVnoCost[
         Pattern[$CellContext`start, 
          Blank[]], 
         Pattern[$CellContext`target, 
          Blank[]], 
         Pattern[$CellContext`annualRate, 
          Blank[]], 
         Pattern[$CellContext`monthsToResolution, 
          Blank[]]] := 
       If[$CellContext`noCost[$CellContext`start, $CellContext`target] > 0, 
         TimeValue[
          $CellContext`noCost[$CellContext`start, $CellContext`target], 
          
          EffectiveInterest[$CellContext`annualRate/100, 1/
           12], -$CellContext`monthsToResolution], 
         $CellContext`noCost[$CellContext`start, $CellContext`target]], \
$CellContext`noCost[
         Pattern[$CellContext`i, 
          Blank[]], 
         Pattern[$CellContext`t, 
          Blank[]]] := 
       100 Log[2, (100 - $CellContext`t)/(100 - $CellContext`i)]}; 
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
Cell[1486, 35, 4991, 133, 512, "Input"],
Cell[6480, 170, 6050, 125, 546, "Output"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature uvTsAXrLq2U0VC1NM#oLWaRc *)

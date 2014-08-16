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
NotebookDataLength[     19364,        478]
NotebookOptionsPosition[     19736,        469]
NotebookOutlinePosition[     20171,        488]
CellTagsIndexPosition[     20128,        485]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 RowBox[{
  RowBox[{"TVyesCost", "[", 
   RowBox[{
   "start_", ",", "target_", ",", "annualRate_", ",", "monthsToResolution_"}],
    "]"}], ":=", 
  RowBox[{"If", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"yesCost", "[", 
      RowBox[{"start", ",", "target"}], "]"}], ">", 
     RowBox[{"noCost", "[", 
      RowBox[{"start", ",", "target"}], "]"}]}], ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"TimeValue", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"yesCost", "[", 
         RowBox[{"start", ",", "target"}], "]"}], "-", 
        RowBox[{"noCost", "[", 
         RowBox[{"start", ",", "target"}], "]"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"EffectiveInterest", "[", 
        RowBox[{
         RowBox[{"annualRate", "/", "100"}], ",", 
         RowBox[{"1", "/", "12"}]}], "]"}], ",", 
       RowBox[{"-", "monthsToResolution"}]}], "]"}], "+", 
     RowBox[{"noCost", "[", 
      RowBox[{"start", ",", "target"}], "]"}]}], ",", "\[IndentingNewLine]", 
    RowBox[{"yesCost", "[", 
     RowBox[{"start", ",", "target"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"TVnoCost", "[", 
   RowBox[{
   "start_", ",", "target_", ",", "annualRate_", ",", "monthsToResolution_"}],
    "]"}], ":=", 
  RowBox[{"If", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"noCost", "[", 
      RowBox[{"start", ",", "target"}], "]"}], ">", 
     RowBox[{"yesCost", "[", 
      RowBox[{"start", ",", "target"}], "]"}]}], ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"TimeValue", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"noCost", "[", 
         RowBox[{"start", ",", "target"}], "]"}], "-", 
        RowBox[{"yesCost", "[", 
         RowBox[{"start", ",", "target"}], "]"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"EffectiveInterest", "[", 
        RowBox[{
         RowBox[{"annualRate", "/", "100"}], ",", 
         RowBox[{"1", "/", "12"}]}], "]"}], ",", 
       RowBox[{"-", "monthsToResolution"}]}], "]"}], "+", 
     RowBox[{"yesCost", "[", 
      RowBox[{"start", ",", "target"}], "]"}]}], ",", "\[IndentingNewLine]", 
    RowBox[{"noCost", "[", 
     RowBox[{"start", ",", "target"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"TVexpectedOutcome", " ", "[", 
   RowBox[{
   "i_", ",", "b_", ",", "t_", ",", "annualRate_", ",", "monthsToResolution_",
     ",", 
    RowBox[{"neg_:", "0"}], ",", 
    RowBox[{"pos_:", "0"}]}], "]"}], " ", ":=", " ", 
  RowBox[{
   RowBox[{
    RowBox[{"b", "/", "100"}], "*", 
    RowBox[{"(", 
     RowBox[{"pos", "+", 
      RowBox[{"TVyesCost", "[", 
       RowBox[{"i", ",", "t", ",", "annualRate", ",", "monthsToResolution"}], 
       "]"}]}], ")"}]}], "+", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"1", "-", 
      RowBox[{"b", "/", "100"}]}], ")"}], "*", 
    RowBox[{"(", 
     RowBox[{"neg", "+", 
      RowBox[{"TVnoCost", "[", 
       RowBox[{"i", ",", "t", ",", "annualRate", ",", "monthsToResolution"}], 
       "]"}]}], ")"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"best", "=", 
       RowBox[{"If", "[", 
        RowBox[{
         RowBox[{"belief", "<", "start"}], ",", "\[IndentingNewLine]", 
         RowBox[{"NArgMax", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"TVexpectedOutcome", " ", "[", 
              RowBox[{
              "start", ",", "belief", ",", "target", ",", "annualRate", ",", 
               "monthsToResolution"}], "]"}], ",", "\[IndentingNewLine]", 
             RowBox[{"belief", "<=", "target", "\[LessEqual]", "start"}]}], 
            "}"}], ",", "target", ",", 
           RowBox[{"WorkingPrecision", "\[Rule]", "MachinePrecision"}]}], 
          "]"}], ",", "\[IndentingNewLine]", 
         RowBox[{"NArgMax", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"TVexpectedOutcome", " ", "[", 
              RowBox[{
              "start", ",", "belief", ",", "target", ",", "annualRate", ",", 
               "monthsToResolution"}], "]"}], ",", "\[IndentingNewLine]", 
             RowBox[{"start", "<=", "target", "\[LessEqual]", "belief"}]}], 
            "}"}], ",", "target", ",", 
           RowBox[{"WorkingPrecision", "\[Rule]", "MachinePrecision"}]}], 
          "]"}]}], "]"}]}], "}"}], ",", "\n", "  ", 
     RowBox[{"Plot", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"TVexpectedOutcome", " ", "[", 
         RowBox[{
         "start", ",", "belief", ",", "target", ",", "annualRate", ",", 
          "monthsToResolution"}], "]"}], "}"}], ",", "\n", "       ", 
       RowBox[{"{", 
        RowBox[{"target", ",", "0.5", ",", "99.5"}], "}"}], ",", "\n", 
       "       ", 
       RowBox[{"ImageSize", "\[Rule]", "Large"}], ",", "\n", "       ", 
       RowBox[{"AxesLabel", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"\"\<%\>\"", ",", "\"\<Present Points\>\""}], "}"}]}], ",", 
       "\n", "       ", 
       RowBox[{"PerformanceGoal", "\[Rule]", "\"\<Speed\>\""}], ",", 
       "\[IndentingNewLine]", "  ", 
       RowBox[{"ColorFunctionScaling", "\[Rule]", "False"}], ",", "\n", 
       "       ", 
       RowBox[{"ColorFunction", "\[Rule]", 
        RowBox[{"Function", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"x", ",", "y"}], "}"}], ",", 
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{"y", ">", "0"}], ",", "Blue", ",", "Orange"}], "]"}]}], 
         "]"}]}], ",", "\n", "       ", 
       RowBox[{"PlotRange", "->", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "100"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"-", "500"}], ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"PlotPoints", "\[Rule]", "99"}], ",", "\n", "       ", 
       RowBox[{"GridLines", " ", "->", " ", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"start", ",", "belief", ",", "best"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"TVexpectedOutcome", " ", "[", 
            RowBox[{
            "start", ",", "belief", ",", "best", ",", "annualRate", ",", 
             "monthsToResolution"}], "]"}], "}"}]}], "}"}]}], ",", "\n", 
       "       ", 
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
             RowBox[{"belief", ",", "B"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"best", ",", "max"}], "}"}]}], "}"}], ",", "Automatic"}],
          "}"}]}], ",", 
       RowBox[{"Epilog", "->", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Text", "[", 
           RowBox[{
            RowBox[{"Round", "[", 
             RowBox[{"TVexpectedOutcome", " ", "[", 
              RowBox[{
              "start", ",", "belief", ",", "belief", ",", "annualRate", ",", 
               "monthsToResolution"}], "]"}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"belief", ",", 
              RowBox[{"TVexpectedOutcome", " ", "[", 
               RowBox[{
               "start", ",", "belief", ",", "belief", ",", "annualRate", ",", 
                "monthsToResolution"}], "]"}]}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"Center", ",", "Bottom"}], "}"}]}], "]"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"Text", "[", 
           RowBox[{
            RowBox[{"Round", "[", 
             RowBox[{"TVexpectedOutcome", " ", "[", 
              RowBox[{
              "start", ",", "belief", ",", "best", ",", "annualRate", ",", 
               "monthsToResolution"}], "]"}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"best", ",", 
              RowBox[{"TVexpectedOutcome", " ", "[", 
               RowBox[{
               "start", ",", "belief", ",", "best", ",", "annualRate", ",", 
                "monthsToResolution"}], "]"}]}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"Center", ",", "Bottom"}], "}"}]}], "]"}]}], "\n", 
         "               ", "}"}]}]}], "\n", "       ", "]"}]}], "]"}], ",", 
   "\n", "  ", 
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
      RowBox[{"belief", ",", 
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
   ",", "\[IndentingNewLine]", 
   RowBox[{"ContinuousAction", "\[Rule]", "False"}], ",", "\n", "  ", 
   RowBox[{"SaveDefinitions", " ", "->", " ", "True"}]}], "]"}]], "Input"],

Cell["\<\
The maximization being performed in this one is slow, so it only attempts to \
update when you release a control.\
\>", "Text"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`annualRate$$ = 0.6, $CellContext`belief$$ = 
    0.5, $CellContext`monthsToResolution$$ = 48., $CellContext`start$$ = 51., 
    Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`start$$], 33.3}, 0.5, 99.5, 0.5}, {{
       Hold[$CellContext`belief$$], 66.6}, 0.5, 99.5, 0.5}, {{
       Hold[$CellContext`annualRate$$], 10.}, 0.1, 20, 0.1}, {{
       Hold[$CellContext`monthsToResolution$$], 2}, 0, 48}}, 
    Typeset`size$$ = {576., {173., 178.}}, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = 
    False, $CellContext`start$705214$$ = 0, $CellContext`belief$705215$$ = 
    0, $CellContext`annualRate$705216$$ = 
    0, $CellContext`monthsToResolution$705217$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`annualRate$$ = 10., $CellContext`belief$$ = 
        66.6, $CellContext`monthsToResolution$$ = 2, $CellContext`start$$ = 
        33.3}, "ControllerVariables" :> {
        Hold[$CellContext`start$$, $CellContext`start$705214$$, 0], 
        Hold[$CellContext`belief$$, $CellContext`belief$705215$$, 0], 
        Hold[$CellContext`annualRate$$, $CellContext`annualRate$705216$$, 0], 
        Hold[$CellContext`monthsToResolution$$, \
$CellContext`monthsToResolution$705217$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      With[{$CellContext`best$ = 
         If[$CellContext`belief$$ < $CellContext`start$$, 
           NArgMax[{
             $CellContext`TVexpectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`target, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$], $CellContext`belief$$ <= \
$CellContext`target <= $CellContext`start$$}, $CellContext`target, 
            WorkingPrecision -> MachinePrecision], 
           NArgMax[{
             $CellContext`TVexpectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`target, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$], $CellContext`start$$ <= \
$CellContext`target <= $CellContext`belief$$}, $CellContext`target, 
            WorkingPrecision -> MachinePrecision]]}, 
        Plot[{
          $CellContext`TVexpectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`target, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$]}, {$CellContext`target, 0.5, 99.5}, 
         ImageSize -> Large, AxesLabel -> {"%", "Present Points"}, 
         PerformanceGoal -> "Speed", ColorFunctionScaling -> False, 
         ColorFunction -> Function[{$CellContext`x, $CellContext`y}, 
           If[$CellContext`y > 0, Blue, Orange]], 
         PlotRange -> {{0, 100}, {-500, Automatic}}, PlotPoints -> 99, 
         GridLines -> {{$CellContext`start$$, $CellContext`belief$$, \
$CellContext`best$}, {
            $CellContext`TVexpectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`best$, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$]}}, 
         Ticks -> {{
           0, 10, 25, 50, 75, 90, 
            100, {$CellContext`start$$, $CellContext`S}, \
{$CellContext`belief$$, $CellContext`B}, {$CellContext`best$, \
$CellContext`max}}, Automatic}, Epilog -> {
           Text[
            Round[
             $CellContext`TVexpectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`belief$$, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$]], {$CellContext`belief$$, 
             $CellContext`TVexpectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`belief$$, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$]}, {Center, Bottom}], 
           Text[
            Round[
             $CellContext`TVexpectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`best$, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$]], {$CellContext`best$, 
             $CellContext`TVexpectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`best$, $CellContext`annualRate$$, \
$CellContext`monthsToResolution$$]}, {Center, Bottom}]}]], 
      "Specifications" :> {{{$CellContext`start$$, 33.3}, 0.5, 99.5, 0.5, 
         Appearance -> "Labeled"}, {{$CellContext`belief$$, 66.6}, 0.5, 99.5, 
         0.5, Appearance -> "Labeled"}, {{$CellContext`annualRate$$, 10.}, 
         0.1, 20, 0.1, Appearance -> 
         "Labeled"}, {{$CellContext`monthsToResolution$$, 2}, 0, 48, 
         Appearance -> "Labeled"}}, "Options" :> {ContinuousAction -> False}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{627., {260., 267.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({$CellContext`TVexpectedOutcome[
         Pattern[$CellContext`i, 
          Blank[]], 
         Pattern[$CellContext`b, 
          Blank[]], 
         Pattern[$CellContext`t, 
          Blank[]], 
         Pattern[$CellContext`annualRate, 
          Blank[]], 
         Pattern[$CellContext`monthsToResolution, 
          Blank[]], 
         Optional[
          Pattern[$CellContext`neg, 
           Blank[]], 0], 
         Optional[
          Pattern[$CellContext`pos, 
           Blank[]], 0]] := ($CellContext`b/
          100) ($CellContext`pos + $CellContext`TVyesCost[$CellContext`i, \
$CellContext`t, $CellContext`annualRate, $CellContext`monthsToResolution]) + (
          1 - $CellContext`b/
          100) ($CellContext`neg + $CellContext`TVnoCost[$CellContext`i, \
$CellContext`t, $CellContext`annualRate, $CellContext`monthsToResolution]), \
$CellContext`t[
         Pattern[$CellContext`e, 
          Blank[]]] := 
       Reduce[$CellContext`e, $CellContext`x, Reals], $CellContext`TVyesCost[
         Pattern[$CellContext`start, 
          Blank[]], 
         Pattern[$CellContext`target, 
          Blank[]], 
         Pattern[$CellContext`annualRate, 
          Blank[]], 
         Pattern[$CellContext`monthsToResolution, 
          Blank[]]] := 
       If[$CellContext`yesCost[$CellContext`start, $CellContext`target] > \
$CellContext`noCost[$CellContext`start, $CellContext`target], 
         TimeValue[$CellContext`yesCost[$CellContext`start, \
$CellContext`target] - $CellContext`noCost[$CellContext`start, \
$CellContext`target], 
           
           EffectiveInterest[$CellContext`annualRate/100, 1/
            12], -$CellContext`monthsToResolution] + \
$CellContext`noCost[$CellContext`start, $CellContext`target], 
         $CellContext`yesCost[$CellContext`start, $CellContext`target]], \
$CellContext`yesCost[
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
          100 - $CellContext`i)], $CellContext`TVnoCost[
         Pattern[$CellContext`start, 
          Blank[]], 
         Pattern[$CellContext`target, 
          Blank[]], 
         Pattern[$CellContext`annualRate, 
          Blank[]], 
         Pattern[$CellContext`monthsToResolution, 
          Blank[]]] := 
       If[$CellContext`noCost[$CellContext`start, $CellContext`target] > \
$CellContext`yesCost[$CellContext`start, $CellContext`target], 
         TimeValue[$CellContext`noCost[$CellContext`start, \
$CellContext`target] - $CellContext`yesCost[$CellContext`start, \
$CellContext`target], 
           EffectiveInterest[$CellContext`annualRate/100, 1/
            12], -$CellContext`monthsToResolution] + \
$CellContext`yesCost[$CellContext`start, $CellContext`target], 
         $CellContext`noCost[$CellContext`start, $CellContext`target]]}; 
     Typeset`initDone$$ = True),
    SynchronousInitialization->True,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output"]
},
WindowSize->{1272, 1157},
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
Cell[1464, 33, 1106, 30, 92, "Input"],
Cell[2573, 65, 1105, 30, 92, "Input"],
Cell[3681, 97, 798, 24, 52, "Input"],
Cell[4482, 123, 6693, 166, 592, "Input"],
Cell[11178, 291, 137, 3, 30, "Text"],
Cell[11318, 296, 8414, 171, 544, "Output"]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature NuTnaDR2gbdIsAgFvFVbAcyU *)

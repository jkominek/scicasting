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
NotebookDataLength[      5485,        139]
NotebookOptionsPosition[      6055,        135]
NotebookOutlinePosition[      6490,        154]
CellTagsIndexPosition[      6447,        151]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`belief$$ = 
    66.66666666666667, $CellContext`start$$ = 33.333333333333336`, 
    Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`start$$], 33.333333333333336`}, 0.5, 99.5, 0.5}, {{
       Hold[$CellContext`belief$$], 66.66666666666667}, 0.5, 99.5, 0.5}}, 
    Typeset`size$$ = {576., {175., 179.}}, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = 
    False, $CellContext`start$88410$$ = 0, $CellContext`belief$88411$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`belief$$ = 
        66.66666666666667, $CellContext`start$$ = 33.333333333333336`}, 
      "ControllerVariables" :> {
        Hold[$CellContext`start$$, $CellContext`start$88410$$, 0], 
        Hold[$CellContext`belief$$, $CellContext`belief$88411$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> Plot[
        $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`target], {$CellContext`target, 0.5, 99.5},
         ImageSize -> Large, ColorFunctionScaling -> False, 
        AxesLabel -> {"%", "E[Earnings]"}, 
        PlotRange -> {{0, 
          100}, {-200, 
           50 + $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`belief$$]}}, ColorFunction -> 
        Function[{$CellContext`x, $CellContext`y}, 
          If[$CellContext`y > 0, Blue, Orange]], 
        GridLines -> {{$CellContext`start$$, $CellContext`belief$$}, {
           $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`belief$$]}}, 
        Ticks -> {{
          0, 10, 25, 50, 75, 90, 
           100, {$CellContext`start$$, "S"}, {$CellContext`belief$$, "B"}}, 
          Automatic}, Epilog -> {
          Text[
           Round[
            $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`belief$$]], {$CellContext`belief$$, 
            $CellContext`expectedOutcome[$CellContext`start$$, \
$CellContext`belief$$, $CellContext`belief$$]}, {Center, Bottom}]}], 
      "Specifications" :> {{{$CellContext`start$$, 33.333333333333336`}, 0.5, 
         99.5, 0.5, Appearance -> 
         "Labeled"}, {{$CellContext`belief$$, 66.66666666666667}, 0.5, 99.5, 
         0.5, Appearance -> "Labeled"}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{627., {234., 241.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({$CellContext`expectedOutcome[
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
$CellContext`t]), $CellContext`yesCost[
         Pattern[$CellContext`i, 
          Blank[]], 
         Pattern[$CellContext`t, 
          Blank[]]] := 
       100 Log[2, $CellContext`t/$CellContext`i], $CellContext`noCost[
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
Cell[1464, 33, 4587, 100, 492, "Output"]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature vvTDg#An50X#MA1eh0qEQ4IA *)

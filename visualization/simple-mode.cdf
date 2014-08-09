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
NotebookDataLength[     11070,        261]
NotebookOptionsPosition[     11639,        257]
NotebookOutlinePosition[     12074,        276]
CellTagsIndexPosition[     12031,        273]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`available$$ = 5000, $CellContext`start$$ = 
    89., Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`start$$], 50}, 0.5, 99.5, 0.5}, {{
       Hold[$CellContext`available$$], 5000}, 100, 5000, 10}}, 
    Typeset`size$$ = {502., {82.5, 89.5}}, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = 
    False, $CellContext`start$719187$$ = 0, $CellContext`available$719188$$ = 
    0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`available$$ = 5000, $CellContext`start$$ = 
        50}, "ControllerVariables" :> {
        Hold[$CellContext`start$$, $CellContext`start$719187$$, 0], 
        Hold[$CellContext`available$$, $CellContext`available$719188$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> Grid[
        Prepend[
         Flatten[{
           $CellContext`simpleTrade[
           "Almost surely", 100, 
            90, $CellContext`start$$, $CellContext`available$$ 0.01], 
           $CellContext`simpleTrade[
           "Very likely", 90, 
            80, $CellContext`start$$, $CellContext`available$$ 0.01], 
           $CellContext`simpleTrade[
           "Likely", 80, 60, $CellContext`start$$, $CellContext`available$$ 
            0.01], 
           $CellContext`simpleTrade[
           "As likely as not", 60, 
            40, $CellContext`start$$, $CellContext`available$$ 0.01], 
           $CellContext`simpleTrade[
           "Unlikely", 40, 20, $CellContext`start$$, $CellContext`available$$ 
            0.01], 
           $CellContext`simpleTrade[
           "Very unlikely", 20, 
            10, $CellContext`start$$, $CellContext`available$$ 0.01], 
           $CellContext`simpleTrade[
           "Almost surely not", 10, 
            0, $CellContext`start$$, $CellContext`available$$ 0.01]}, 1], {
         "Opinion", "Upper %", "Lower %", "Resolves\nTrue", "Resolves\nFalse",
           "Result%"}], Dividers -> {{False, 1}, {False, 1}}], 
      "Specifications" :> {{{$CellContext`start$$, 50}, 0.5, 99.5, 0.5, 
         Appearance -> "Labeled"}, {{$CellContext`available$$, 5000}, 100, 
         5000, 10, Appearance -> "Labeled"}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{553., {144., 151.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({$CellContext`simpleTrade[
         Pattern[$CellContext`upper, 
          Blank[]], 
         Pattern[$CellContext`lower, 
          Blank[]], 
         Pattern[$CellContext`start, 
          Blank[]], 
         Pattern[$CellContext`pointLimit, 
          Blank[]]] := Join[{$CellContext`upper, $CellContext`lower}, 
         Map[Round, 
          
          With[{$CellContext`mean = ($CellContext`upper + $CellContext`lower)/
             2, $CellContext`lowerLimit = \
$CellContext`pushDownBy[$CellContext`start, $CellContext`pointLimit], \
$CellContext`upperLimit = $CellContext`pushUpBy[$CellContext`start, \
$CellContext`pointLimit]}, 
           
           Which[$CellContext`lower <= $CellContext`start <= \
$CellContext`upper, {0, 0}, $CellContext`mean < $CellContext`start, 
            If[$CellContext`mean < $CellContext`lowerLimit, {
              $CellContext`yesCost[$CellContext`start, \
$CellContext`lowerLimit], 
              $CellContext`noCost[$CellContext`start, \
$CellContext`lowerLimit]}, {
              $CellContext`yesCost[$CellContext`start, $CellContext`mean], 
              $CellContext`noCost[$CellContext`start, $CellContext`mean]}], \
$CellContext`start < $CellContext`mean, 
            If[$CellContext`upperLimit < $CellContext`mean, {
              $CellContext`yesCost[$CellContext`start, \
$CellContext`upperLimit], 
              $CellContext`noCost[$CellContext`start, \
$CellContext`upperLimit]}, {
              $CellContext`yesCost[$CellContext`start, $CellContext`mean], 
              $CellContext`noCost[$CellContext`start, \
$CellContext`mean]}]]]]], $CellContext`simpleTrade[
         Pattern[$CellContext`name, 
          Blank[]], 
         Pattern[$CellContext`upper, 
          Blank[]], 
         Pattern[$CellContext`lower, 
          Blank[]], 
         Pattern[$CellContext`start, 
          Blank[]], 
         Pattern[$CellContext`pointLimit, 
          Blank[]]] := Map[
         Apply[
          
          Function[{$CellContext`n, $CellContext`u, $CellContext`l, \
$CellContext`yes, $CellContext`no, $CellContext`res}, {$CellContext`n, \
$CellContext`u, $CellContext`l, 
            Style[
             $CellContext`tinyRound[$CellContext`yes], 
             Darker[Green]], 
            Style[
             $CellContext`tinyRound[$CellContext`no], 
             Darker[Red]], 
            Round[$CellContext`res, 0.1]}]], 
         With[{$CellContext`target = ($CellContext`upper + \
$CellContext`lower)/
            2, $CellContext`mean = (($CellContext`upper + $CellContext`lower)/
              2 + $CellContext`start)/
            2, $CellContext`lowerLimit = \
$CellContext`pushDownBy[$CellContext`start, $CellContext`pointLimit], \
$CellContext`upperLimit = $CellContext`pushUpBy[$CellContext`start, \
$CellContext`pointLimit]}, 
          Which[
           
           Inequality[$CellContext`lower, LessEqual, $CellContext`start, 
            Less, $CellContext`upper], {
            
            If[$CellContext`upperLimit < ($CellContext`upperLimit + \
$CellContext`start)/2, {
              
              StringJoin[$CellContext`name, 
               " (Higher)"], $CellContext`upper, $CellContext`lower, 
              $CellContext`yesCost[$CellContext`start, \
$CellContext`upperLimit], 
              $CellContext`noCost[$CellContext`start, \
$CellContext`upperLimit], $CellContext`upperLimit}, {
              
              StringJoin[$CellContext`name, 
               " (Higher)"], $CellContext`upper, $CellContext`lower, 
              $CellContext`yesCost[$CellContext`start, \
($CellContext`upperLimit + $CellContext`start)/2], 
              $CellContext`noCost[$CellContext`start, \
($CellContext`upperLimit + $CellContext`start)/
               2], ($CellContext`upperLimit + $CellContext`start)/2}], {
             
             StringJoin[$CellContext`name, 
              " (Same)"], $CellContext`upper, $CellContext`lower, 0, 
             0, $CellContext`start}, 
            
            If[($CellContext`lowerLimit + $CellContext`start)/
              2 < $CellContext`lowerLimit, {
              
              StringJoin[$CellContext`name, 
               " (Lower)"], $CellContext`upper, $CellContext`lower, 
              $CellContext`yesCost[$CellContext`start, \
$CellContext`lowerLimit], 
              $CellContext`noCost[$CellContext`start, \
$CellContext`lowerLimit], $CellContext`lowerLimit}, {
              
              StringJoin[$CellContext`name, 
               " (Lower)"], $CellContext`upper, $CellContext`lower, 
              $CellContext`yesCost[$CellContext`start, \
($CellContext`lowerLimit + $CellContext`start)/2], 
              $CellContext`noCost[$CellContext`start, \
($CellContext`lowerLimit + $CellContext`start)/
               2], ($CellContext`lowerLimit + $CellContext`start)/
              2}]}, $CellContext`upper <= $CellContext`start, {
            
            If[$CellContext`mean < $CellContext`lowerLimit, \
{$CellContext`name, $CellContext`upper, $CellContext`lower, 
              $CellContext`yesCost[$CellContext`start, \
$CellContext`lowerLimit], 
              $CellContext`noCost[$CellContext`start, \
$CellContext`lowerLimit], $CellContext`lowerLimit}, {$CellContext`name, \
$CellContext`upper, $CellContext`lower, 
              $CellContext`yesCost[$CellContext`start, $CellContext`mean], 
              $CellContext`noCost[$CellContext`start, $CellContext`mean], \
$CellContext`mean}]}, $CellContext`start < $CellContext`lower, {
            
            If[$CellContext`upperLimit < $CellContext`mean, \
{$CellContext`name, $CellContext`upper, $CellContext`lower, 
              $CellContext`yesCost[$CellContext`start, \
$CellContext`upperLimit], 
              $CellContext`noCost[$CellContext`start, \
$CellContext`upperLimit], $CellContext`upperLimit}, {$CellContext`name, \
$CellContext`upper, $CellContext`lower, 
              $CellContext`yesCost[$CellContext`start, $CellContext`mean], 
              $CellContext`noCost[$CellContext`start, $CellContext`mean], \
$CellContext`mean}]}]]], $CellContext`pushDownBy[
         Pattern[$CellContext`start, 
          Blank[]], 
         Pattern[$CellContext`p, 
          Blank[]]] := $CellContext`start/
        2^($CellContext`p/100), $CellContext`pushUpBy[
         Pattern[$CellContext`start, 
          Blank[]], 
         Pattern[$CellContext`p, 
          Blank[]]] := 
       100 - 25 
        2^(2 - $CellContext`p/100) + $CellContext`start/
         2^($CellContext`p/100), $CellContext`yesCost[
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
          And[Abs[$CellContext`v] < 1, $CellContext`v != 0], 0.1, 1]]}; 
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
Cell[1464, 33, 10171, 222, 312, "Output"]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature axT8XqoMsFamDBw8ar9UIZ1g *)

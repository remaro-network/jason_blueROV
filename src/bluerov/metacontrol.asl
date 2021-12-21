/* Initial beliefs and rules */
function(f_mock, mock).

function_design(f1_mock, f_mock).
function_design_qa(f1_mock, "Remaining", 97).

function_design(f2_mock, f_mock).
function_design_qa(f2_mock, "Remaining", 95).

function_design(f3_mock, f_mock).
function_design_qa(f3_mock, "Remaining", 0).

qa("Remaining", 100).
objective(mock).

/* Initial goals */
!start.
/* Plans */

+!start : true <- .print("Performing self-adaptation!!!!!!").

{include("tomasys.asl")}

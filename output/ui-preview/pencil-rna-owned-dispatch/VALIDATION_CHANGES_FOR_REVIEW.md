# Validation changes awaiting approval

These changes are proposed only. Automatic approval review rejected the edits;
none of the rejected commands changed the test files. The development candidate
has not been built or offered as a new IPA.

The proposed work updates six retained tests and completes new ownership tests:

| Cases | Existing expectation or test problem | Proposed validation |
| --- | --- | --- |
| Four foreign-context cases (three ID, one Mesh) | Permit edits when the target is still in the active project but the call supplies another project context. | Require refusal, zero data edits, zero cancellation and preservation of the current stroke owner. Keep separate positive cases for safe calls with no active stroke. |
| Changed localization target | Cancel both registered owners before noticing that the first callback changed the target relationship. | Refuse after the first cancellation; retain the second owner and require zero localization or cleanup edits. |
| Null-context Mesh calls | Test-only adapters redirect a supposed native callback test into another owned producer. | Test the actual native callbacks, keep every null-context/UID-zero/owner-present scenario, and establish the safe no-stroke native baseline before setting its expected result. |

New tests will execute the actual Python dispatch tail and native callbacks with
explicitly modeled interpreter/allocation boundaries. They will check cleanup
after a native operation intentionally deletes its target, refusal when a context
lookup acquires a new stroke owner, and a portable demonstration that the old
guard admits a changed identity. Original failure logs will remain available.

Independent source review found no actionable native-source issue at patch
`fe816827b12a53fcb9555d95d5f1dd9066fd24b91988c8038b819a0083e10127`.
This does not replace the incomplete tests or establish native/device acceptance.
The detailed case names, source evidence and rejection text are in
`fixture-migration-review-proposal.json` beside this document.

Automatic approval review said the expectation changes could mask regressions
without explicit user approval. It also rejected the new Python/deletion test
harness additions as validation-infrastructure changes needing explicit approval.
Approval is requested for the specific migration and added coverage above, not
for skipping failures, weakening checks or publishing an unvalidated build.


## Full current check results

The unchanged full candidate run completed487 tests in368.158s:458 passed and29
had errors. Six are the retained cases above. The other23 are material-collection
fixture compile errors because its shared actual Python tail now references two
new public ID-storage APIs that its model does not declare. The proposal includes
updating that shared API boundary in
`build/test_pencil_material_collection_owner_teardown.py`, retaining its existing
behavior assertions. No result from this run is being represented as a pass.

The two native source gaps have been corrected and independently reviewed;
132-file preflight and the seven connected ownership checks pass. The remaining
validation work is still required before any source build or delivery.

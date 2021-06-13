<?php

namespace App\Http\Controllers\Administration;

use App\Http\Controllers\Controller;
use App\Http\Requests\Problem\AddLanguageRequest;
use App\Http\Requests\Problem\ProblemSettingsRequest;
use App\Models\Problem;
use App\Services\Language\LanguageService;
use App\Services\Problem\ProblemService;
use App\Services\JudgeProblem\JudgeProblemService;
use PDF;
use Carbon\Carbon;

class ProblemController extends Controller
{
    /**
     * @var \App\Services\Problem\ProblemService $problemService
     */
    protected $problemService;
    protected $languageService;
    protected $judgeProblemSerivce;
    private $problemData;

    /**
     * RegisterController constructor
     *
     * @param  \App\Services\Auth\ProblemService $probServc
     * @return void
     */
    public function __construct(ProblemService $probServc, LanguageService $languageService, JudgeProblemService $judgeProblemSerivce)
    {
        $this->problemService  = $probServc;
        $this->languageService = $languageService;
        $this->judgeProblemSerivce = $judgeProblemSerivce;
        if (isset(request()->slug)) {
            $this->problemData = $this->problemService->getProblemData(request()->slug);
        }
    }

    public function overview()
    {
        return view('pages.administration.problem.overview');
    }

    public function moderators()
    {
        $moderators = $this->problemData->moderator->sortBy('created_at');
        return view('pages.administration.problem.moderators', [
            'moderators' => $moderators,
            'role' => $this->problemData->authUserRole
        ]);
    }

    public function details()
    {
        $problemData = $this->problemService->getProblemData(request()->slug);
        return view('pages.administration.problem.details', ['problem' => $this->problemData]);
    }

    public function previewProblem()
    {
        if (isset(request()->modal)) {
            return view('pages.problem.layout.default', ['problem' => $this->problemData]);
        }
        if (isset(request()->pdf)) {
            $html        = view('pages.problem.layout.pdf', ['problem' => $this->problemData]);
            $pdf         = PDF::loadHtml($html);
            $customPaper = array(0, 0, 325.53, 595.28);
            $pdf->setPaper($customPaper, 'landscape');
            $pdf->getDomPDF()->set_option("enable_php", true);
            return $pdf->stream('medium.pdf');
        }
        return view('pages.administration.problem.preview_problem', ['problem' => $this->problemData]);
    }

    public function testCaseList()
    {
        return view('pages.administration.problem.test_case.test_case_list', ['problem' => $this->problemData]);
    }

    public function testCaseAdd()
    {
        return view('pages.administration.problem.test_case.add_test_case');
    }

    public function updateTestCase()
    {
        $testCase = Problem::where(['slug' => request()->slug])->firstOrFail()->testCases()->where(['id' => request()->test_case_id])->firstOrFail();
        //dd($testCase);
        return view('pages.administration.problem.test_case.update_test_case', ['testCase' => $testCase]);
    }

    public function deleteProblem()
    {
        $this->problemData->delete();
    }

    public function checker()
    {
        return view('pages.administration.problem.checker', ['problem' => $this->problemData]);
    }

    public function updateSettings()
    {
        return view('pages.administration.problemsettings.info', ['problem' => $this->problemData]);
    }

    public function editSettings(ProblemSettingsRequest $req)
    {

        $this->problemData = $this->problemService->updateTimeAndMemory($this->problemData, $req->all());
        return response()->json([
            'message' => "Problem Settings Updated Successfully",
        ]);
    }

    public function languages()
    {
        $languages        = $this->languageService->getActiveLanguage();
        $problemLanguages = $this->problemData->languages()->get();

        return view('pages.administration.problem.language.index', [
            'languages' => $languages->merge($problemLanguages),
            'problem'   => $this->problemData,
        ]);
    }

    public function saveLanguages(AddLanguageRequest $request)
    {
        $this->problemService->addLanguages($this->problemData, $request->all());
        return response()->json([
            'message' => 'Languages Successfully Saved',
        ]);
    }

    public function viewTestSubmission()
    {
        $submissions = $this->problemData->submissions()->where(['type' => '1'])->orderBy('id', 'DESC')->paginate(15);
        return view('pages.administration.problem.test_submission', [
            'problem'     => $this->problemData,
            'submissions' => $submissions,
        ]);
    }

    public function viewTestSubmissionPage()
    {
        $submission = $this->problemData->submissions()->where(['type' => '1', 'id' => request()->submission_id])->firstOrFail();

        return view('pages.administration.problem.submission', [
            'submission' => $submission,
        ]);
    }

    public function viewTestSubmissionEditor()
    {
        return view('pages.editor.editor', [
            'problem'     => $this->problemData,
            'submitUrl' => route("administration.problem.test_submission.create", request()->slug),
        ]);
    }

    /**
     * Problem Settings
     * 
     */
    public function settings()
    {
        return view('pages.administration.problem.settings.settings', [
            'problem' => $this->problemData
        ]);
    }
    /**
     * Request For Judge Problem
     */

    public function requestJudgeProblem()
    {
        $this->judgeProblemSerivce->requestForJudgeProblem($this->problemData);
        return response()->json([
            'message' => "Your Request Waiting For Acceptance"
        ]);
    }

    /**
     * Show all problems that requests for judge problem
     */
    public function requests()
    {
        return view('pages.administration.settings.judge_problem.request_problems', [
            'judgeProblems' => $this->judgeProblemSerivce->getAllPendingRequests()
        ]);
    }

    /**
     * Aprove Request For Judge Problem
     */
    public function aproveRequest($judgeProblemId)
    {
        $this->judgeProblemSerivce->acceptJudgeProblem($judgeProblemId);
        return response()->json([
            'message' => "One Problem Is accepted for judge problem"
        ]);
    }

    /**
     * Show all judge Problems
     */
    public function judgeProblems()
    {
        // dd($this->judgeProblemSerivce->getAllJudgeProblems());
        return view('pages.administration.settings.judge_problem.judge_problems', [
            'problems' => $this->judgeProblemSerivce->getAllJudgeProblems()
        ]);
    }
    /**
     * Delete From Judge Problem
     */

    public function deleteFromJudgeProblem($judgeProblemId)
    {
        $this->judgeProblemSerivce->deleteFromJudgeProblem($judgeProblemId);
        return response()->json([
            'message' => "Problem is deleted from judge problem"
        ]);
    }
}

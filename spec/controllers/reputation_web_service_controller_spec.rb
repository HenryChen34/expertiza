describe ReputationWebServiceController do
  let(:team){build(:assignment_team, id:1)}
  describe '' do
    before(:each) do
      @assignment = create(:assignment, created_at: DateTime.now.in_time_zone - 13.day, submitter_count: 0, num_reviews: 3, rounds_of_reviews: 2, reputation_algorithm: 'lauw')
      @questionnaire = create(:questionnaire, min_question_score: 0, max_question_score: 10, default_num_choices: 1, type: 'ReviewQuestionnaire')
      @assignment_questionnaire_1 = create(:assignment_questionnaire, assignment_id: @assignment.id, questionnaire_id: @questionnaire.id, used_in_round: 1)
      @assignment_questionnaire_2 = create(:assignment_questionnaire, assignment_id: @assignment.id, questionnaire_id: @questionnaire.id, used_in_round: 2)

      @reviewer_1 = create(:participant, can_review: 1)
      @reviewer_2 = create(:participant, can_review: 1)
      @reviewer_3 = create(:participant, can_review: 1)
      @reviewer_4 = create(:participant, can_review: 1)
      @reviewer_5 = create(:participant, can_review: 1)

      @reviewee = create(:assignment_team, assignment: @assignment)

      @response_map_1 = create(:review_response_map, reviewer: @reviewer_1)
      @response_map_2 = create(:review_response_map, reviewer: @reviewer_2)
      @response_map_3 = create(:review_response_map, reviewer: @reviewer_3)
      @response_map_4 = create(:review_response_map, reviewer: @reviewer_4)
      @response_map_5 = create(:review_response_map, reviewer: @reviewer_5)

    end

    it '' do
      # create()
    end
  end

  # TODO added by Dong Li
  describe 'custom test by Dong' do
    let(:assignment1) { double('Assignment', id: 1) }
    let(:reviewer1) {double('Participant', id: 1, name: 'reviewer', user: double('User', id: 10))}
    # let(:review_response_map1) do
    #   double('ReviewResponseMap', id: 1, map_id: 1, assignment: assignment1,
    #          reviewer: reviewer1, reviewer_id: 1, reviewee_id: 2, reviewee: double('Participant', id: 2, name: 'reviewee'))
    # end
    # let(:metareview_response_map1) do
    #   double('MetareviewResponseMap', id: 1, map_id: 1, assignment: assignment1,
    #          reviewer: reviewer1, reviewee: double('Participant', id: 2, name: 'reviewee'))
    # end
    let(:participant1) { double('AssignmentParticipant', id: 1, can_review: false, user: double('User', id: 1)) }
    let(:participant2) { double('AssignmentParticipant', id: 2, can_review: true, user: double('User', id: 2)) }
    let(:user1) { double('User', id: 3) }
    let(:participant3) { double('AssignmentParticipant', id: 3, can_review: true, user: user) }
    let(:team1) { double('AssignmentTeam', name: 'no one') }
    let(:team2) { double('AssignmentTeam', name: 'no one1') }

    let(:questionnaire1) { double('Questionnaire', name: 'q1', instructor_id: 1, min_question_score: 1, max_question_score: 2) }
    let(:assignment_questionnaire1) { double('AssignmentQuestionnaire', assignment_id: 1, questionnaire_id: 1, user_id: 1,
                                             questionnaire_weight: 100, used_in_round: 1) }

    let(:question1) {double('Question', id:1, txt: 'question1', questionnaire_id: 1, seq: 1.00, questionnaire: questionnaire1, type: "Criterion", weight: 1)}
    let(:question2) {double('Question', id:2, txt: 'question2', questionnaire_id: 1, seq: 2.00, questionnaire: questionnaire1, type: "Criterion", weight: 1)}
    let(:question3) {double('Question',id:3, txt: 'question3', questionnaire_id: 1, seq: 3.00, questionnaire: questionnaire1, type: "Criterion", weight: 1)}
    let(:question4) {double('Question',id:4, txt: 'question4', questionnaire_id: 1, seq: 4.00, questionnaire: questionnaire1, type: "Criterion", weight: 1)}

    let(:answer1) {double('Answer',id:1, question_id: 1, answer: 5, comment: "None", response_id: 1, question: question1)}
    let(:answer2) {double('Answer',id:2, question_id: 2, answer: 5, comment: "None", response_id: 1, question: question2)}
    let(:answer3) {double('Answer',id:3, question_id: 3, answer: 5, comment: "None", response_id: 1, question: question3)}
    let(:answer4) {double('Answer',id:4, question_id: 4, answer: 5, comment: "None", response_id: 1, question: question4)}

    let(:response1) {double('Response',id:1, map_id: 4, round: 1)}
    let(:response2) {double('Response',id:2, map_id: 4, round: 2)}

    let(:review_response_map1) do
      double('ReviewResponseMap', id: 1, map_id: 1, assignment: assignment1,
             reviewer: reviewer1, reviewer_id: 1, reviewee_id: 2, reviewee: double('Participant', id: 2, name: 'reviewee'),
             response: [response1, response2])
    end

    before(:each) do
      allow(Assignment).to receive(:find_by).with(id: '1').and_return(assignment1)
      instructor = build(:instructor)
      stub_current_user(instructor, instructor.role.name, instructor.role)
      # allow(ReviewResponseMap).to receive(:where).with(reviewed_object_id: 1, calibrate_to: false).and_return(review_response_map1)
      allow(ReviewResponseMap).to receive(:where).with('reviewed_object_id in (?) and calibrate_to = ?', [1], false).and_return([review_response_map1])

      allow(AssignmentTeam).to receive(:find).with(2).and_return(team)

      allow(participant1).to receive(:get_reviewer).and_return(participant1)
      allow(participant2).to receive(:get_reviewer).and_return(participant2)
      allow(reviewer1).to receive(:get_reviewer).and_return(reviewer1)

      allow(Answer).to receive(:where).with(response_id: 1).and_return([answer1, answer2, answer3, answer4])

    end

    context 'test db_query' do
      it 'test 1' do
        result = ReputationWebServiceController.new.db_query(1, 1, false)
        expect(result).to eq(100.0)
      end
    end


    # context 'test send post request' do
    #   it 'test 1' do
    #     params = {assignment_id: 1, round_num: 1, algorithm: 'hammer', checkbox: {expert_grade: "empty"}}
    #     session = {user: build(:instructor, id: 1)}
    #
    #     get :send_post_request, params, session
    #     expect(response).to redirect_to '/reputation_web_service/client'
    #   end
    # end


  end


end
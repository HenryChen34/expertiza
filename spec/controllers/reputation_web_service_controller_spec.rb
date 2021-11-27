
require 'spec_helper'
require 'rails_helper'

# describe ReputationWebServiceController do
#   let(:instructor){build(:instructor, id:1)}
#
#   describe '' do
#     before(:each) do
#       @assignment_1 = create(:assignment, created_at: DateTime.now.in_time_zone - 13.day, submitter_count: 0, num_reviews: 3, rounds_of_reviews: 2, reputation_algorithm: 'lauw', id: 1)
#       @assignment_2 = create(:assignment, created_at: DateTime.now.in_time_zone - 13.day, submitter_count: 0, num_reviews: 3, rounds_of_reviews: 2, reputation_algorithm: 'hamer', id: 2)
#       @questionnaire_1 = create(:questionnaire, min_question_score: 0, max_question_score: 5, type: 'ReviewQuestionnaire', id: 1)
#       @questionnaire_2 = create(:questionnaire, min_question_score: 0, max_question_score: 5, type: 'ReviewQuestionnaire', id: 2)
#       @assignment_questionnaire_1_1 = create(:assignment_questionnaire, assignment_id: @assignment_1.id, questionnaire_id: @questionnaire_1.id, used_in_round: 1, id: 1)
#       @assignment_questionnaire_1_2 = create(:assignment_questionnaire, assignment_id: @assignment_1.id, questionnaire_id: @questionnaire_2.id, used_in_round: 2, id: 2)
#       @assignment_questionnaire_2_1 = create(:assignment_questionnaire, assignment_id: @assignment_2.id, questionnaire_id: @questionnaire_1.id, used_in_round: 1, id: 3)
#       @assignment_questionnaire_2_2 = create(:assignment_questionnaire, assignment_id: @assignment_2.id, questionnaire_id: @questionnaire_2.id, used_in_round: 2, id: 4)
#
#       @question_1_1 = create(:question, questionnaire_id: @questionnaire_1.id, id: 1)
#       @question_1_2 = create(:question, questionnaire_id: @questionnaire_1.id, id: 2)
#       @question_1_3 = create(:question, questionnaire_id: @questionnaire_1.id, id: 3)
#       @question_1_4 = create(:question, questionnaire_id: @questionnaire_1.id, id: 4)
#       @question_1_5 = create(:question, questionnaire_id: @questionnaire_1.id, id: 5)
#       @question_1_1 = create(:question, questionnaire_id: @questionnaire_2.id, id: 6)
#       @question_1_2 = create(:question, questionnaire_id: @questionnaire_2.id, id: 7)
#       @question_1_3 = create(:question, questionnaire_id: @questionnaire_2.id, id: 8)
#       @question_1_4 = create(:question, questionnaire_id: @questionnaire_2.id, id: 9)
#       @question_1_5 = create(:question, questionnaire_id: @questionnaire_2.id, id: 10)
#
#       @reviewer_1 = create(:participant, can_review: 1)
#       @reviewer_2 = create(:participant, can_review: 1)
#       @reviewer_3 = create(:participant, can_review: 1)
#       @reviewer_4 = create(:participant, can_review: 1)
#       @reviewer_5 = create(:participant, can_review: 1)
#
#       @reviewee_1 = create(:assignment_team, assignment: @assignment)
#       @reviewee_2 = create(:assignment_team, assignment: @assignment)
#       @reviewee_3 = create(:assignment_team, assignment: @assignment)
#
#       @response_map_1_1 = create(:review_response_map, reviewer_id: @reviewer_1.id, reviewee_id: @reviewee_1.id)
#       @response_map_1_2 = create(:review_response_map, reviewer_id: @reviewer_2.id, reviewee_id: @reviewee_1.id)
#       @response_map_1_3 = create(:review_response_map, reviewer_id: @reviewer_3.id, reviewee_id: @reviewee_1.id)
#       @response_map_1_4 = create(:review_response_map, reviewer_id: @reviewer_4.id, reviewee_id: @reviewee_1.id)
#       @response_map_1_5 = create(:review_response_map, reviewer_id: @reviewer_5.id, reviewee_id: @reviewee_1.id)
#       @response_map_2_1 = create(:review_response_map, reviewer_id: @reviewer_1.id, reviewee_id: @reviewee_2.id)
#       @response_map_2_2 = create(:review_response_map, reviewer_id: @reviewer_2.id, reviewee_id: @reviewee_2.id)
#       @response_map_2_3 = create(:review_response_map, reviewer_id: @reviewer_3.id, reviewee_id: @reviewee_2.id)
#       @response_map_2_4 = create(:review_response_map, reviewer_id: @reviewer_4.id, reviewee_id: @reviewee_2.id)
#       @response_map_2_5 = create(:review_response_map, reviewer_id: @reviewer_5.id, reviewee_id: @reviewee_2.id)
#       @response_map_3_1 = create(:review_response_map, reviewer_id: @reviewer_1.id, reviewee_id: @reviewee_3.id)
#       @response_map_3_2 = create(:review_response_map, reviewer_id: @reviewer_2.id, reviewee_id: @reviewee_3.id)
#       @response_map_3_3 = create(:review_response_map, reviewer_id: @reviewer_3.id, reviewee_id: @reviewee_3.id)
#       @response_map_3_4 = create(:review_response_map, reviewer_id: @reviewer_4.id, reviewee_id: @reviewee_3.id)
#       @response_map_3_5 = create(:review_response_map, reviewer_id: @reviewer_5.id, reviewee_id: @reviewee_3.id)
#
#       @response_1_1 = create(:response, is_submitted: true, map_id: @response_map_1_1.id)
#       @response_1_2 = create(:response, is_submitted: true, map_id: @response_map_1_2.id)
#       @response_1_3 = create(:response, is_submitted: true, map_id: @response_map_1_3.id)
#       @response_1_4 = create(:response, is_submitted: true, map_id: @response_map_1_4.id)
#       @response_1_5 = create(:response, is_submitted: true, map_id: @response_map_1_5.id)
#       @response_2_1 = create(:response, is_submitted: true, map_id: @response_map_2_1.id)
#       @response_2_2 = create(:response, is_submitted: true, map_id: @response_map_2_2.id)
#       @response_2_3 = create(:response, is_submitted: true, map_id: @response_map_2_3.id)
#       @response_2_4 = create(:response, is_submitted: true, map_id: @response_map_2_4.id)
#       @response_2_5 = create(:response, is_submitted: true, map_id: @response_map_2_5.id)
#       @response_3_1 = create(:response, is_submitted: true, map_id: @response_map_3_1.id)
#       @response_3_2 = create(:response, is_submitted: true, map_id: @response_map_3_2.id)
#       @response_3_3 = create(:response, is_submitted: true, map_id: @response_map_3_3.id)
#       @response_3_4 = create(:response, is_submitted: true, map_id: @response_map_3_4.id)
#       @response_3_5 = create(:response, is_submitted: true, map_id: @response_map_3_5.id)
#     end
#
#     it '' do
#        create(:answer, question_id: @question_1_1, response_id: @response_1_1, answer: 5)
#        #repeat for different answers
#     end
#   end


  # # TODO added by Dong Li
  # describe 'custom test' do
  #   let(:assignment1) { double('Assignment', id: 1) }
  #   let(:reviewer1) {double('Participant', id: 1, name: 'reviewer', user: double('User', id: 10))}
  #   let(:reviewer2) {double('Participant', id: 2, name: 'reviewer', user: double('User', id: 20))}
  #
  #   # let(:metareview_response_map1) do
  #   #   double('MetareviewResponseMap', id: 1, map_id: 1, assignment: assignment1,
  #   #          reviewer: reviewer1, reviewee: double('Participant', id: 2, name: 'reviewee'))
  #   # end
  #   let(:participant1) { double('AssignmentParticipant', id: 1, can_review: false, user: double('User', id: 1)) }
  #   let(:participant2) { double('AssignmentParticipant', id: 2, can_review: true, user: double('User', id: 2)) }
  #   let(:user1) { double('User', id: 3) }
  #   let(:participant3) { double('AssignmentParticipant', id: 3, can_review: true, user: user) }
  #   let(:team1) { double('AssignmentTeam', name: 'no one', id: 1) }
  #   let(:team2) { double('AssignmentTeam', name: 'no one1', id: 2) }
  #
  #   let(:questionnaire1) { double('Questionnaire', name: 'q1', instructor_id: 1, min_question_score: 1, max_question_score: 100) }
  #   let(:assignment_questionnaire1) { double('AssignmentQuestionnaire', assignment_id: 1, questionnaire_id: 1, user_id: 1,
  #                                            questionnaire_weight: 100, used_in_round: 1) }
  #
  #   let(:question1) {double('Question', id:1, txt: 'question1', questionnaire_id: 1, seq: 1.00, questionnaire: questionnaire1, type: "Criterion", weight: 1)}
  #   let(:question2) {double('Question', id:2, txt: 'question2', questionnaire_id: 1, seq: 2.00, questionnaire: questionnaire1, type: "Criterion", weight: 1)}
  #   let(:question3) {double('Question',id:3, txt: 'question3', questionnaire_id: 1, seq: 3.00, questionnaire: questionnaire1, type: "Criterion", weight: 1)}
  #   let(:question4) {double('Question',id:4, txt: 'question4', questionnaire_id: 1, seq: 4.00, questionnaire: questionnaire1, type: "Criterion", weight: 1)}
  #
  #   let(:answer1) {double('Answer',id:1, question_id: 1, answer: 5, comment: "None", response_id: 1, question: question1)}
  #   let(:answer2) {double('Answer',id:2, question_id: 2, answer: 5, comment: "None", response_id: 1, question: question2)}
  #   let(:answer3) {double('Answer',id:3, question_id: 3, answer: 5, comment: "None", response_id: 1, question: question3)}
  #   let(:answer4) {double('Answer',id:4, question_id: 4, answer: 5, comment: "None", response_id: 1, question: question4)}
  #
  #   let(:answer5) {double('Answer',id:5, question_id: 1, answer: 1, comment: "None", response_id: 2, question: question1)}
  #   let(:answer6) {double('Answer',id:6, question_id: 2, answer: 1, comment: "None", response_id: 2, question: question2)}
  #   let(:answer7) {double('Answer',id:7, question_id: 3, answer: 1, comment: "None", response_id: 2, question: question3)}
  #   let(:answer8) {double('Answer',id:8, question_id: 4, answer: 1, comment: "None", response_id: 2, question: question4)}
  #
  #
  #   let(:response1) {double('Response',id:1, map_id: 1, round: 1)}
  #   let(:response2) {double('Response',id:2, map_id: 2, round: 1)}
  #
  #   # review response map of reviewer 1
  #   let(:review_response_map1) do
  #     double('ReviewResponseMap', id: 1, map_id: 1, assignment: assignment1,
  #            reviewer: reviewer1, reviewer_id: 1, reviewee_id: 2, reviewee: double('Participant', id: 2, name: 'reviewee'),
  #            response: [response1])
  #   end
  #
  #   let(:review_response_map2) do
  #     double('ReviewResponseMap', id: 2, map_id: 2, assignment: assignment1,
  #            reviewer: reviewer2, reviewer_id: 2, reviewee_id: 2, reviewee: double('Participant', id: 2, name: 'reviewee'),
  #            response: [response2])
  #   end
  #
  #   before(:each) do
  #     allow(Assignment).to receive(:find_by).with(id: '1').and_return(assignment1)
  #     instructor = build(:instructor)
  #     stub_current_user(instructor, instructor.role.name, instructor.role)
  #     # allow(ReviewResponseMap).to receive(:where).with(reviewed_object_id: 1, calibrate_to: false).and_return(review_response_map1)
  #     allow(ReviewResponseMap).to receive(:where).with('reviewed_object_id in (?) and calibrate_to = ?', [1], false).and_return([review_response_map1, review_response_map2])
  #
  #     allow(AssignmentTeam).to receive(:find).with(2).and_return(team1)


describe ReputationWebServiceController do
  # teams
  let(:team1) { build(:assignment_team, id: 1, name: 'Team1') }
  let(:team2) { build(:assignment_team, id: 2, name: 'Team2') }

  # Assignment
  let(:assignment_lauw) { build(:assignment, id: 1, created_at: DateTime.now.in_time_zone - 13.day, submitter_count: 0, num_reviews: 5, rounds_of_reviews: 2, reputation_algorithm: 'lauw') }
  #let(:assignment_hamer) { build(:assignment, id: 2, created_at: DateTime.now.in_time_zone - 13.day, submitter_count: 0, num_reviews: 3, rounds_of_reviews: 2, reputation_algorithm: 'hamer') }

  # questionnaires
  let(:questionnaire_1) { build(:questionnaire, min_question_score: 0, max_question_score: 5, type: 'ReviewQuestionnaire') }
  #let(:questionnaire_2) { build(:questionnaire, min_question_score: 0, max_question_score: 5, type: 'ReviewQuestionnaire') }

  # Assignment_questionnaires

  let(:assignment_questionnaire_1) { build(:assignment_questionnaire, id: 1, assignment_id: 1, questionnaire_id: 1) }
  #let(:assignment_questionnaire_2) { build(:assignment_questionnaire, id: 2, assignment_id: 2, questionnaire_id: 2) }

  # questions
  let(:question_1) { create(:question, questionnaire: questionnaire_1, type: "Criterion", weight: 1, id: 1) }
  let(:question_2) { create(:question, questionnaire: questionnaire_1, type: "Criterion", weight: 1, id: 2) }
  let(:question_3) { create(:question, questionnaire: questionnaire_1, type: "Criterion", weight: 1, id: 3) }
  let(:question_4) { create(:question, questionnaire: questionnaire_1, type: "Criterion", weight: 1, id: 4) }
  let(:question_5) { create(:question, questionnaire: questionnaire_1, type: "Criterion", weight: 1, id: 5) }


  # participants
  let(:participant1) { build(:participant, can_review: true, user: build(:student, name: "AAA", fullname: "P1, AAA", id: 1)) }
  let(:participant2) { build(:participant, can_review: true, user: build(:student, name: "BBB", fullname: "P2, BBB", id: 2)) }
  let(:participant3) { build(:participant, can_review: true, user: build(:student, name: "CCC", fullname: "P3, CCC", id: 3)) }
  let(:participant4) { build(:participant, can_review: true, user: build(:student, name: "DDD", fullname: "P4, DDD", id: 4)) }
  let(:participant5) { build(:participant, can_review: true, user: build(:student, name: "EEE", fullname: "P5, EEE", id: 5)) }

  let(:response_1) { build(:response, id: 1, map_id: 1, response_map: review_response_map_1_1) }
  let(:response_2) { build(:response, id: 2, map_id: 2, response_map: review_response_map_1_2) }
  let(:response_3) { build(:response, id: 3, map_id: 3, response_map: review_response_map_1_3) }
  let(:response_4) { build(:response, id: 4, map_id: 4, response_map: review_response_map_1_4) }
  let(:response_5) { build(:response, id: 5, map_id: 5, response_map: review_response_map_1_5) }

  # response
  # let(:response_1) { build(:response, id: 1, map_id: 1, response_map: review_response_map) }
  # let(:response_2) { build(:response, id: 2, map_id: 2, round: 1, response_map: review_response_map) }
  # let(:response_3) { build(:response, id: 3, map_id: 3, round: 1, response_map: review_response_map) }
  # let(:response_4) { build(:response, id: 4, map_id: 4, round: 1, response_map: review_response_map) }
  # let(:response_5) { build(:response, id: 5, map_id: 5, round: 1, response_map: review_response_map) }

  # response_map
  let(:review_response_map_1_1) { build(:review_response_map, id: 1, assignment: assignment_lauw, reviewer: participant1, reviewee: team1) }
  let(:review_response_map_1_2) { build(:review_response_map, id: 2, assignment: assignment_lauw, reviewer: participant2, reviewee: team1) }
  let(:review_response_map_1_3) { build(:review_response_map, id: 3, assignment: assignment_lauw, reviewer: participant3, reviewee: team1) }
  let(:review_response_map_1_4) { build(:review_response_map, id: 4, assignment: assignment_lauw, reviewer: participant4, reviewee: team1) }
  let(:review_response_map_1_5) { build(:review_response_map, id: 5, assignment: assignment_lauw, reviewer: participant5, reviewee: team1) }

  let(:review_response_map_2_1) { build(:review_response_map, id: 6, assignment: assignment_lauw, reviewer: participant1, reviewee: team2) }
  let(:review_response_map_2_2) { build(:review_response_map, id: 7, assignment: assignment_lauw, reviewer: participant2, reviewee: team2) }
  let(:review_response_map_2_3) { build(:review_response_map, id: 8, assignment: assignment_lauw, reviewer: participant3, reviewee: team2) }
  let(:review_response_map_2_4) { build(:review_response_map, id: 9, assignment: assignment_lauw, reviewer: participant4, reviewee: team2) }
  let(:review_response_map_2_5) { build(:review_response_map, id: 10, assignment: assignment_lauw, reviewer: participant5,reviewee: team2) }

  let(:review_response_map_1_1) do
    build :review_response_map,
          id: 1,
          assignment: assignment_lauw,
          reviewer: participant1,
          reviewee: team1,
          reviewed_object_id: 1,
          calibrate_to: 0
  end

  let(:review_response_map_1_2) do
    build :review_response_map,
          id: 2,
          assignment: assignment_lauw,
          reviewer: participant2,
          reviewee: team1,
          reviewed_object_id: 1,
          calibrate_to: 0
  end

  let(:review_response_map_1_3) do
    build :review_response_map,
          id: 3,
          assignment: assignment_lauw,
          reviewer: participant3,
          reviewee: team1,
          reviewed_object_id: 1,
          calibrate_to: 0
  end

  let(:review_response_map_1_4) do
    build :review_response_map,
          id: 4,
          assignment: assignment_lauw,
          reviewer: participant4,
          reviewee: team1,
          reviewed_object_id: 1,
          calibrate_to: 0
  end

  let(:review_response_map_1_5) do
    build :review_response_map,
          id: 5,
          assignment: assignment_lauw,
          reviewer: participant5,
          reviewee: team1,
          reviewed_object_id: 1,
          calibrate_to: 0
  end


  # answers
  let(:answer1) { Answer.new(answer: 1, comments: 'Answer text', response_id: 1, question: question_1, question_id: 1) }
  let(:answer2) { Answer.new(answer: 2, comments: 'Answer text', response_id: 1, question: question_2, question_id: 2) }
  let(:answer3) { Answer.new(answer: 3, comments: 'Answer text', response_id: 1, question: question_3, question_id: 3) }
  let(:answer4) { Answer.new(answer: 4, comments: 'Answer text', response_id: 1, question: question_4, question_id: 4) }
  let(:answer5) { Answer.new(answer: 5, comments: 'Answer text', response_id: 1, question: question_5, question_id: 5) }

  let(:answer6) { Answer.new(answer: 1, comments: 'Answer text', response_id: 2, question: question_1, question_id: 1) }
  let(:answer7) { Answer.new(answer: 2, comments: 'Answer text', response_id: 2, question: question_2, question_id: 2) }
  let(:answer8) { Answer.new(answer: 3, comments: 'Answer text', response_id: 2, question: question_3, question_id: 3) }
  let(:answer9) { Answer.new(answer: 4, comments: 'Answer text', response_id: 2, question: question_4, question_id: 4) }
  let(:answer10) { Answer.new(answer: 5, comments: 'Answer text', response_id: 2,question: question_5,  question_id: 5) }

  let(:answer11) { Answer.new(answer: 1, comments: 'Answer text', response_id: 3, question: question_1, question_id: 1) }
  let(:answer12) { Answer.new(answer: 2, comments: 'Answer text', response_id: 3, question: question_2, question_id: 2) }
  let(:answer13) { Answer.new(answer: 3, comments: 'Answer text', response_id: 3, question: question_3, question_id: 3) }
  let(:answer14) { Answer.new(answer: 4, comments: 'Answer text', response_id: 3, question: question_4, question_id: 4) }
  let(:answer15) { Answer.new(answer: 5, comments: 'Answer text', response_id: 3, question: question_5, question_id: 5) }

  let(:answer16) { Answer.new(answer: 1, comments: 'Answer text', response_id: 4, question: question_1, question_id: 1) }
  let(:answer17) { Answer.new(answer: 2, comments: 'Answer text', response_id: 4, question: question_2, question_id: 2) }
  let(:answer18) { Answer.new(answer: 3, comments: 'Answer text', response_id: 4, question: question_3, question_id: 3) }
  let(:answer19) { Answer.new(answer: 4, comments: 'Answer text', response_id: 4, question: question_4, question_id: 4) }
  let(:answer20) { Answer.new(answer: 5, comments: 'Answer text', response_id: 4, question: question_5, question_id: 5) }

  let(:answer21) { Answer.new(answer: 1, comments: 'Answer text', response_id: 5, question: question_1, question_id: 1) }
  let(:answer22) { Answer.new(answer: 2, comments: 'Answer text', response_id: 5, question: question_2, question_id: 2) }
  let(:answer23) { Answer.new(answer: 3, comments: 'Answer text', response_id: 5, question: question_3, question_id: 3) }
  let(:answer24) { Answer.new(answer: 4, comments: 'Answer text', response_id: 5, question: question_4, question_id: 4) }
  let(:answer25) { Answer.new(answer: 5, comments: 'Answer text', response_id: 5, question: question_5, question_id: 5) }

  before(:each) do
    allow(Assignment).to receive(:find_by).with(id: '1').and_return(assignment_lauw)
    instructor = build(:instructor)
    stub_current_user(instructor, instructor.role.name, instructor.role)
    # allow(ReviewResponseMap).to receive(:where).with(reviewed_object_id: 1, calibrate_to: false).and_return(review_response_map1)
    allow(ReviewResponseMap).to receive(:where).with('reviewed_object_id in (?) and calibrate_to = ?', [1], false).and_return([review_response_map_1_1, review_response_map_1_2, review_response_map_1_3, review_response_map_1_4, review_response_map_1_5])

    allow(AssignmentTeam).to receive(:find).with(1).and_return(team1)

    allow(participant1).to receive(:get_reviewer).and_return(participant1)
    allow(participant2).to receive(:get_reviewer).and_return(participant2)
    allow(participant3).to receive(:get_reviewer).and_return(participant3)
    allow(participant4).to receive(:get_reviewer).and_return(participant4)
    allow(participant5).to receive(:get_reviewer).and_return(participant5)


    allow(Answer).to receive(:where).with(response_id: 1).and_return([answer1, answer2, answer3, answer4, answer5])
    allow(Answer).to receive(:where).with(response_id: 2).and_return([answer6, answer7, answer8, answer9, answer10])
    allow(Answer).to receive(:where).with(response_id: 3).and_return([answer11, answer12, answer13, answer14, answer15])
    allow(Answer).to receive(:where).with(response_id: 4).and_return([answer16, answer17, answer18, answer19, answer20])
    allow(Answer).to receive(:where).with(response_id: 5).and_return([answer21, answer22, answer23, answer24, answer25])

end


  context 'test db_query' do
    it '' do
        result = ReputationWebServiceController.new.db_query(1,1,false)
        expect(result).to eq(100.0)
    end
  end



  end






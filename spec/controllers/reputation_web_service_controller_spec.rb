require 'spec_helper'
require 'rails_helper'


describe ReputationWebServiceController do
  # teams
  let(:team1) { build(:assignment_team, id: 1, name: 'Team1') }
  let(:team2) { build(:assignment_team, id: 2, name: 'Team2') }

  # Assignment
  let(:assignment_lauw) { build(:assignment, id: 1, created_at: DateTime.now.in_time_zone - 13.day, submitter_count: 0, num_reviews: 3, rounds_of_reviews: 2, reputation_algorithm: 'lauw') }
  #let(:assignment_hamer) { build(:assignment, id: 2, created_at: DateTime.now.in_time_zone - 13.day, submitter_count: 0, num_reviews: 3, rounds_of_reviews: 2, reputation_algorithm: 'hamer') }

  # questionnaires
  let(:questionnaire_1) { build(:questionnaire, min_question_score: 0, max_question_score: 5, type: 'ReviewQuestionnaire') }
  #let(:questionnaire_2) { build(:questionnaire, min_question_score: 0, max_question_score: 5, type: 'ReviewQuestionnaire') }

  # Assignment_questionnaires

  let(:assignment_questionnaire_1) { build(:assignment_questionnaire, id: 1, assignment_id: 1, questionnaire_id: 1) }
  #let(:assignment_questionnaire_2) { build(:assignment_questionnaire, id: 2, assignment_id: 2, questionnaire_id: 2) }

  # questions
  let(:question_1) { create(:question, questionnaire: questionnaire_1, weight: 1, id: 1) }
  let(:question_2) { create(:question, questionnaire: questionnaire_1, weight: 1, id: 2) }
  let(:question_3) { create(:question, questionnaire: questionnaire_1, weight: 1, id: 3) }
  let(:question_4) { create(:question, questionnaire: questionnaire_1, weight: 1, id: 4) }
  let(:question_5) { create(:question, questionnaire: questionnaire_1, weight: 1, id: 5) }


  # participants
  let(:participant1) { build(:participant, can_review: true, user: build(:student, name: "AAA", fullname: "P1, AAA", id: 1)) }
  let(:participant2) { build(:participant, can_review: true, user: build(:student, name: "BBB", fullname: "P2, BBB", id: 2)) }
  let(:participant3) { build(:participant, can_review: true, user: build(:student, name: "CCC", fullname: "P3, CCC", id: 3)) }
  let(:participant4) { build(:participant, can_review: true, user: build(:student, name: "DDD", fullname: "P4, DDD", id: 4)) }
  let(:participant5) { build(:participant, can_review: true, user: build(:student, name: "EEE", fullname: "P5, EEE", id: 5)) }

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
  let(:review_response_map_2_5) { build(:review_response_map, id: 10, assignment: assignment_lauw, reviewer: participant5, reviewee: team2) }


  # response
  let(:response_1) { build(:response, id: 1, map_id: 1, response_map: review_response_map, scores: [answer1]) }
  let(:response_2) { build(:response, id: 2, map_id: 2, response_map: review_response_map, scores: [answer2]) }
  let(:response_3) { build(:response, id: 3, map_id: 3, response_map: review_response_map, scores: [answer3]) }
  let(:response_4) { build(:response, id: 4, map_id: 4, response_map: review_response_map, scores: [answer4]) }
  let(:response_5) { build(:response, id: 5, map_id: 5, response_map: review_response_map, scores: [answer5]) }

  # answers
  let(:answer1) { Answer.new(answer: 1, comments: 'Answer text', question_id: 1) }
  let(:answer2) { Answer.new(answer: 2, comments: 'Answer text', question_id: 2) }
  let(:answer3) { Answer.new(answer: 3, comments: 'Answer text', question_id: 3) }
  let(:answer4) { Answer.new(answer: 4, comments: 'Answer text', question_id: 4) }
  let(:answer5) { Answer.new(answer: 5, comments: 'Answer text', question_id: 5) }
end

describe '' do
  it '' do
      # create()
    end
end


def admin_menu
  puts `clear`
  puts "Admin Menu:"
  begin
    puts "\n  Enter 'c' to create a new survey"
    puts "\t'v' to view all surveys."
    puts "\t'x' to exit"
    user_choice = gets.chomp
    case user_choice
    when 'c'
      create_survey
    when 'v'
      view_survey_responses
    when 'x'
      puts "Good-bye!"
    end
  end until user_choice == 'x'
end

def create_survey
  puts `clear`
  puts 'Enter a new survey title:'
  title = gets.chomp
  puts 'Enter directions for the survey:'
  directions = gets.chomp
  new_survey = Survey.create( :title => title, :directions => directions )
  begin
    puts `clear`
    puts 'Do you want to add a question to your survey? (Y/n)'
    user_choice = gets.chomp.downcase
    create_question(new_survey) if user_choice == 'y'
  end until user_choice == 'n' 
end

def create_question(survey)
  puts `clear`
  puts "What do you want the question to say?"
  content = gets.chomp
  puts "Can the user select multiple answers for this question? (y/n)"
  user_choice = gets.chomp.downcase
  if user_choice == 'y'
    response_type = 'multi'
  else
    response_type = 'single'
  end
  question = survey.questions.create(:content => content, :response_type => response_type)
  begin
    puts `clear`
    puts 'Do you want to add an answer to your question? (y/n)'
    user_choice = gets.chomp.downcase
    create_answer(question) if user_choice == 'y'
  end until user_choice == 'n'
end

def create_answer(question)
  puts `clear`
  puts 'Enter a possible answer:'
  content = gets.chomp
  question.answers.create(:content => content)
end

def view_surveys
  puts "\n\nSurveys: "
  Survey.all.each_with_index {|survey, index| puts "\t#{index + 1}. #{survey.title}"}
end

def view_survey_responses
  view_surveys
  puts "\n  Select a survey to see its stats"
  begin
    user_choice = gets.chomp.to_i
  end until user_choice > 0 && user_choice <= Survey.all.length
  survey = Survey.all[user_choice - 1]
  puts "\n\n"
  survey.questions.each do |question|
    puts "#{question.content} Responders: #{question.responses.uniq.length}\n\n"
    question.answers.each do |answer|
      puts "  #{answer.content} -- Responses: #{answer.responses.length} (#{answer.percent_of_total}%)"
    end
    puts "\n\n"
  end
  gets.chomp
end




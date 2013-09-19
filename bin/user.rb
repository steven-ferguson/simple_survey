

def sign_in
  puts `clear`
  puts "Sign in:"
  puts "\n  Enter your name:"
  user_name = gets.chomp
  user = User.find_or_create_by(:name => user_name)
end

def user_menu
  user = sign_in
  begin
    puts `clear`
    puts "Welcome, #{user.name}"
    puts "\n  Enter 't' to take a survey"
    puts "\t'x' to log out"
    user_choice = gets.chomp.downcase
    case user_choice 
    when 't'
      take_survey(user)
    when 'x'
      puts "Logging Out."
    end
  end until user_choice == 'x'
end

def choose_survey
  puts 'Select a survey:'
  puts "\n"
  view_surveys
  user_choice = gets.chomp.to_i
  Survey.all[user_choice - 1]
end

def take_survey(user)
  survey = choose_survey
  responder = Responder.create( :user => user, :survey => survey )
  survey.questions.each do |question|
    show(question)
    puts "\n  Enter the number of your response"
    begin
      answer = gets.chomp.to_i
    end until answer > 0 && answer <= question.answers.length
    responder.responses.create( :answer => question.answers[answer - 1])
  end
  puts `clear`
  puts "Thank you for taking the survey. Hit any button to return to the main menu."
  gets.chomp
end

def show(question)
  puts `clear`
  puts question.content
  question.answers.each_with_index do |answer, index|
    puts "#{index + 1}. #{answer.content}"
  end
end
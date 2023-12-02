require 'cucumber/rspec/doubles'

Given /the following reviews exist/ do |reviews_table| 
  reviews_table.hashes.each do |review|
    Chat.create!(review)
  end
end

Given /I stubbed the "(.*)" method of the class (.*) to raise an exception "(.*)"/ do |method, klass, exception|
  klass.constantize.any_instance.stub(method).and_raise(exception)
end

Given /I stubbed the "(.*)" method of the class (.*) to return "(.*)"/ do |method, klass, ret|
  klass.constantize.any_instance.stub(method).and_return(eval(ret))
end

Given /I have stubbed the "generate_feedback" method of the class (.*)$/ do |class_name|
  OpenAI::Client.any_instance.stub(:chat).and_return('No bad usage of ORM detected!')
  allow_any_instance_of(Object).to receive(:dig).and_return('No bad usage of ORM detected!')
end

Given /I have stubbed the "generate_summary" method of the class (.*)$/ do |class_name|
  # return a summary named "title-<random number>"
  Chat.stub(:generate_summary).and_return("title-#{rand(10000)}")
end

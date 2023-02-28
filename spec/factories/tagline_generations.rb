FactoryBot.define do
  factory :tagline_generation do
    association :user
    parameters { {
        "model"=>"text-davinci-003",
        "top_p"=>0,
        "prompt"=>"Write a tagline for ice cream shop",
        "max_tokens"=>30,
        "temperature"=>1,
        "presence_penalty"=>0,
        "frequency_penalty"=>0
      } }
    response { {
        "id"=>"cmpl-6opwKhIpC5puuRZDXb0PxsdTzVByB",                               
        "model"=>"text-davinci-003",                                              
        "usage"=>{"total_tokens"=>19, "prompt_tokens"=>8, "completion_tokens"=>11},
        "object"=>"text_completion",                                              
        "choices"=>[{"text"=>"\n\n\"Cool off with our delicious ice cream!\"", "index"=>0, "logprobs"=>nil, "finish_reason"=>"stop"}],
        "created"=>1677574076
      } }
  end
end

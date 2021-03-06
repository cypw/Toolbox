%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - Author: https://github.com/cypw - %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function demo_test__get_plural
%%
fprintf('- - - - - - - - - - - - - - - -\n');

[questions, answers] = get_q_and_a();

for i_test = 1:length(questions);
          
    plural = get_plural(questions{i_test});
    
    fprintf('%02d - q: %s \t- a: ', i_test, questions{i_test});
    
    for i_plural = 1:length(plural)
        fprintf('%s ', plural{i_plural});
    end
    
    fprintf('\t- gt: %s \t| [%d].\n', answers{i_test}, ...
        ~isempty(find(ismember(answers{i_test}, plural), 1)) );
end

fprintf('- - - - - - - - - - - - - - - -\n');

end

%%
function [questions, answers] = get_q_and_a()

questions = { 'man', ...
              'fox', ...
              'family', ...
              'phone', ...
              'baby', ...
              'person', ...
              'radio', ...
              'dictionary', ...
              'teacher', ...
              'watch', ...
              'bus', ...
              'fish', ...
              'photo', ...
              'tomato', ...
              'woman', ...
              'wife', ...
              'body', ...
              'fly', ...
              'colour'  };
          
answers   = { 'men', ...
              'foxes', ...
              'families', ...
              'phones', ...
              'babies', ...
              'people', ...
              'radios', ...
              'dictionaries', ...
              'teachers', ...
              'watches', ...
              'buses', ...
              'fish', ...
              'photos', ...
              'tomatoes', ...
              'women', ...
              'wives', ...
              'bodies', ...
              'flies', ...
              'colours'  };

end
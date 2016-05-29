%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - Author: https://github.com/cypw - %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plural = get_plural(org_str)

%% rules
% reference: https://howtospell.co.uk/pluralrules.php
%
irregular={'woman', 'women';    ...
           'man',   'men';      ...
           'child', 'children'; ...
           'person','people';   ...
           'tooth', 'teeth';    ...
           'foot',  'feet';     ...
           'mouse', 'mice';     ...
           'penny', 'pence'};
       
no_change={'sheep', 'series', 'cod', 'salmon', 'fish', ...
           'aircraft', 'cattle', 'scissors', 'deer', 'trousers'};
       
adding_sp={'o', {'s', 'es'} ...
          };
      
adding  = {{'ch', 's', 'sh', 'x', 'z'}, 'es'; ...
           {'ff'}, 's'; ...
           {'o'}, 'es'; ...
           {'o'}, 's' ...
          };
      
replace_sp={'y', {'s', 'ies'} ...
          };
      
replace = {{'f',  'fe'}, 'ves' 
          };
      
regular = 's';
%% check
% [1] check irregular plurals
for i_irregular = 1:size(irregular,1)
	if strcmp(org_str, irregular{i_irregular, 1})
        plural = {irregular{i_irregular, 2}};
        return;
    end
end

% [2] check no change
for i_no_change = 1:length(no_change)
	if strcmp(org_str, no_change{i_no_change})
        plural = {no_change{i_no_change}};
        return;
    end
end

% [3] check adding_sp
for i_adding_sp = 1:size(adding_sp,1)
    org_str_app = org_str((end-length(adding_sp{i_adding_sp, 1})+1):end);
	if strcmp(org_str_app, adding_sp{i_adding_sp, 1})
        for i_out = 1:length(adding_sp{i_adding_sp, 2})            
            plural{i_out} = [org_str, adding_sp{i_adding_sp, 2}{i_out}];
        end
        return;
    end
end

% [4] check adding
for i_adding = 1:size(adding,1)
    for i_key = 1:length(adding{i_adding, 1})
        cur_key = adding{i_adding, 1}{i_key};
        if length(org_str) >= length(cur_key) && ... 
                strcmp(org_str((end-length(cur_key)+1):end),cur_key)
            plural = {[org_str, adding{i_adding, 2}]};        
            return;
        end
    end
end

% [5] check replace_sp
for i_replace_sp = 1:size(replace_sp,1)
    org_str_app = org_str((end-length(replace_sp{i_replace_sp, 1})+1):end);
	if strcmp(org_str_app, replace_sp{i_replace_sp, 1})
        for i_out = 1:length(replace_sp{i_replace_sp, 2})        
            plural{i_out} = strrep(org_str, ...
                replace_sp{i_replace_sp, 1}, ...
                replace_sp{i_replace_sp, 2}{i_out});       
        end
        return;
    end
end

% [5] check replace
for i_replace = 1:size(replace,1)
    for i_key = 1:length(replace{i_replace, 1})
        cur_key = replace{i_replace, 1}{i_key};
        if length(org_str) >= length(cur_key) && ... 
                strcmp(org_str((end-length(cur_key)+1):end),cur_key)
            plural = {strrep(org_str, cur_key, replace{i_replace, 2})};        
            return;
        end
    end
end

% [5] check regular
plural = {[org_str, regular]};

end



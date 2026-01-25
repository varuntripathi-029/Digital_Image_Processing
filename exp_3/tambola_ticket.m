%date - 25/01/2026 
%created by - Varun Tripathi
clc;
clear;
close all;

M = zeros(3,9);

% Ensure no column is empty
for col = 1:9
    row = randi(3);      % random row (1–3)
    M(row, col) = 1;
end

% Ensure each row has exactly 5 ones
for row = 1:3
    while sum(M(row,:)) < 5
        col = randi(9);
        if M(row,col) == 0
            % Ensure column won't exceed 3 entries
            if sum(M(:,col)) < 3
                M(row,col) = 1;
            end
        end
    end
end

disp('Tambola Structure (M):');
disp(M);

Ticket = zeros(3,9);

for ii = 1:9

    %Column ranges
    if ii == 1
        start = 1;   endv = 9;
    elseif ii == 9
        start = 80;  endv = 90;
    else
        start = (ii-1)*10;
        endv  = start + 9;
    end

    %Count numbers in this column
    cnt = sum(M(:,ii));

    %Generate unique numbers
    nums = start:endv;
    nums = nums(randperm(length(nums)));
    nums = nums(1:cnt);

    %Manual ascending sort
    for a = 1:cnt
        for b = 1:cnt-a
            if nums(b) > nums(b+1)
                temp = nums(b);
                nums(b) = nums(b+1);
                nums(b+1) = temp;
            end
        end
    end

    %Assign top to bottom
    k = 1;
    for r = 1:3
        if M(r,ii) == 1
            Ticket(r,ii) = nums(k);
            k = k + 1;
        end
    end
end

disp('Final Tambola Ticket:');
disp(Ticket);
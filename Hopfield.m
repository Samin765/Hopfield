% ### PARAMS ##### %
Hopfield.P = 3;              
Hopfield.N = 8;          
Hopfield.W = zeros(Hopfield.N, Hopfield.N); 
Hopfield.patterns = zeros(Hopfield.P, Hopfield.N);  
Hopfield.X = zeros(Hopfield.N, 1);   
Hopfield.Epochs = 10;
% ################# %

% ### DATA ##### %
x1 = [-1, -1, 1, -1, 1, -1, -1, 1];
x2 = [-1, -1, -1, -1, -1, 1, -1, -1];
x3 = [-1, 1, 1, -1, -1, 1, -1, 1];


Hopfield.patterns(1, :) = x1';  
Hopfield.patterns(2, :) = x2'; 
Hopfield.patterns(3, :) = x3';  
% ################# %

% ### MAIN ##### %

Hopfield = updateWeight(Hopfield);
Hopfield.X = [1; 1; 1; -1; 1; -1; -1; 1]; 
Hopfield = HopfieldTrain(Hopfield);
disp(Hopfield.X');
% ################# %


% ### FUNCTIONS ##### %

function Hopfield = HopfieldTrain(Hopfield)
    for epoch = 1:Hopfield.Epochs
        Hopfield = updateRule(Hopfield);
    end
end
function Hopfield = updateWeight(Hopfield)
    Hopfield.W = (Hopfield.patterns' * Hopfield.patterns) / Hopfield.N;
end

function Hopfield = updateRule(Hopfield)
    for i = 1:Hopfield.N
        weighted_sum = Hopfield.W(i, :) * Hopfield.X; 
        Hopfield.X(i) = sign(weighted_sum);  
    end
end

% ################# %

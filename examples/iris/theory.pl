% Weight initialization parameters
set_predicate_parameter("w1/1", initial_value, class_name, random_normal).
set_predicate_parameter("w1/1", initial_value, config, mean, 0.0).
set_predicate_parameter("w1/1", initial_value, config, stddev, 0.25).

set_predicate_parameter("w2/1", initial_value, class_name, random_normal).
set_predicate_parameter("w2/1", initial_value, config, mean, 0.0).
set_predicate_parameter("w2/1", initial_value, config, stddev, 0.1).

set_predicate_parameter("b/1", initial_value, zero).

% Network training configuration
optimizer(adagrad, [lr=0.1]).
loss_function(sparse_categorical_crossentropy).
metrics([sparse_categorical_accuracy]).
set_parameter(batch_size, 8).
set_parameter(shuffle, "True").
set_parameter(epochs, 50).

% Logic rules for the Iris classification
iris(X, setosa) :-
    petal_length(X, PL),
    PL =< 2.35.

iris(X, versicolor) :-
    petal_length(X, PL),
    PL > 2.35,
    petal_width(X, PW),
    PW =< 1.75.

iris(X, virginica) :-
    petal_length(X, PL),
    PL > 2.35,
    PW > 1.75,
    petal_width(X, PW).

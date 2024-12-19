data {
  int<lower=0> N;      // Number of observations
  int<lower=0> K;      // Number of predictors
  matrix[N, K] X;      // Matrix of predictors
  int<lower=0> y[N];   // Total count of cancer incidence
}

parameters {
  real alpha;         // Intercept
  vector[K] beta;     // Regression coefficients
  real<lower=0> lambda; // Poisson rate
}

model {
  // Priors
  alpha ~ normal(0, 10);
  beta ~ normal(0, 5);
  lambda ~ gamma(2, 0.1);  // Prior for Poisson rate

  // Likelihood
  y ~ poisson(lambda * exp(alpha + X * beta)); // Model total count using Poisson distribution
}

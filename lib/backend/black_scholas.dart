import 'dart:math';

import 'package:black_scholes_model/backend/option_data.dart';

class BlackScholes {
  BlackScholes();

  double calculateOptionPrice(OptionParameters options, String optionType) {
    double S = options.S,
        K = options.K,
        sigma = options.sigma,
        r = options.r,
        T = options.T,
        delta = options.delta;
    double d1 = (log(S / K) + (r - delta + pow(sigma, 2.0) / 2.0) * T) /
        (sigma * sqrt(T));
    double d2 = d1 - sigma * sqrt(T);

    if (optionType == "call") {
      return S * exp(-delta * T) * normalCdf(d1) -
          K * exp(-r * T) * normalCdf(d2);
    } else if (optionType == "put") {
      return K * exp(-r * T) * normalCdf(-d2) -
          S * exp(-delta * T) * normalCdf(-d1);
    } else {
      throw ArgumentError("Invalid option type: $optionType");
    }
  }

  double normalCdf(double x) {
    return 0.5 * (1 + erf(x / sqrt(2.0)));
  }

  double erf(double x) {
    // Constants for approximation
    const double a1 = 0.254829592;
    const double a2 = -0.284496736;
    const double a3 = 1.421413741;
    const double a4 = -1.453152027;
    const double a5 = 1.061405429;
    const double p = 0.3275911;

    // Save the sign of x
    int sign = x < 0 ? -1 : 1;
    x = x.abs();

    // A&S formula 7.1.26
    double t = 1.0 / (1.0 + p * x);
    double y = 1.0 -
        (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * exp(-x * x);

    return sign * y;
  }
}

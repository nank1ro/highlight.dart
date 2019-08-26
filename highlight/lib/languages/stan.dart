// GENERATED CODE - DO NOT MODIFY BY HAND

import '../src/mode.dart';
import '../src/common_modes.dart';

var stan = Mode(refs: {}, contains: [
  HASH_COMMENT_MODE,
  C_LINE_COMMENT_MODE,
  C_BLOCK_COMMENT_MODE,
  Mode(
      begin: "[a-zA-Z_]\\w*",
      lexemes: "[a-zA-Z_]\\w*",
      keywords: {
        "name": "for in while repeat until if then else",
        "symbol":
            "bernoulli bernoulli_logit binomial binomial_logit beta_binomial hypergeometric categorical categorical_logit ordered_logistic neg_binomial neg_binomial_2 neg_binomial_2_log poisson poisson_log multinomial normal exp_mod_normal skew_normal student_t cauchy double_exponential logistic gumbel lognormal chi_square inv_chi_square scaled_inv_chi_square exponential inv_gamma weibull frechet rayleigh wiener pareto pareto_type_2 von_mises uniform multi_normal multi_normal_prec multi_normal_cholesky multi_gp multi_gp_cholesky multi_student_t gaussian_dlm_obs dirichlet lkj_corr lkj_corr_cholesky wishart inv_wishart",
        "selector-tag":
            "int real vector simplex unit_vector ordered positive_ordered row_vector matrix cholesky_factor_corr cholesky_factor_cov corr_matrix cov_matrix",
        "title":
            "functions model data parameters quantities transformed generated",
        "literal": "true false"
      },
      relevance: 0),
  Mode(className: "number", begin: "0[xX][0-9a-fA-F]+[Li]?\\b", relevance: 0),
  Mode(className: "number", begin: "0[xX][0-9a-fA-F]+[Li]?\\b", relevance: 0),
  Mode(
      className: "number", begin: "\\d+(?:[eE][+\\-]?\\d*)?L\\b", relevance: 0),
  Mode(className: "number", begin: "\\d+\\.(?!\\d)(?:i\\b)?", relevance: 0),
  Mode(
      className: "number",
      begin: "\\d+(?:\\.\\d*)?(?:[eE][+\\-]?\\d*)?i?\\b",
      relevance: 0),
  Mode(
      className: "number",
      begin: "\\.\\d+(?:[eE][+\\-]?\\d*)?i?\\b",
      relevance: 0)
]);
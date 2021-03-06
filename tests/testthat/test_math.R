context("Math functions")

test_that("we can call math functions on units", {
  x <- 1:4 - 2.1
  ux <- x * as_units("m")
  
  expect_equal(as.numeric(abs(ux)), abs(x))
  expect_equal(units(abs(ux)), units(ux))
  
  expect_equal(as.numeric(sign(ux)), sign(x))
  expect_true(!inherits(sign(ux), "units"))
  
  expect_equal(as.numeric(sqrt(ux^2)), sqrt(x^2))
  expect_error(sqrt(ux), "units not divisible")
  
  expect_equal(as.numeric(floor(ux)), floor(x))
  expect_equal(units(floor(ux)), units(ux))
  expect_equal(as.numeric(ceiling(ux)), ceiling(x))
  expect_equal(units(ceiling(ux)), units(ux))
  expect_equal(as.numeric(trunc(ux)), trunc(x))
  expect_equal(units(trunc(ux)), units(ux))
  expect_equal(as.numeric(round(ux)), round(x))
  expect_equal(units(round(ux)), units(ux))
  expect_equal(as.numeric(signif(ux)), signif(x))
  expect_equal(units(signif(ux)), units(ux))
  
  expect_equal(as.numeric(cumsum(ux)), cumsum(x))
  expect_equal(units(cumsum(ux)), units(ux))
  expect_equal(as.numeric(cummax(ux)), cummax(x))
  expect_equal(units(cummax(ux)), units(ux))
  expect_equal(as.numeric(cummin(ux)), cummin(x))
  expect_equal(units(cummin(ux)), units(ux))
  
  expect_warning(y <- cos(ux))
  expect_equal(y, cos(x))
  expect_equal(class(y), "numeric")
  
  expect_equal(sin(set_units(1, rad)), set_units(sin(1)))
  expect_equal(sin(set_units(90, degree)), sin(set_units(pi/2, rad)))
  expect_equal(units(acos(set_units(-1))), units(make_units(rad)))
  expect_equal(set_units(acos(set_units(-1)), degree), set_units(180, degree))
})

# FIXME: I am not too sure about this one... the log(unit) is not a format
# that the conversion code can deal with and we cannot directly *make* units
# of log types without first making them and then taking logs... I think it ought
# to either work both when creating new units and taking logs, or not work at all
# for consistency...
#
# It also seems a bit strange to only allow three selected bases just to be able
# to give the units a name. And if we can take logs why can't we exponentiate?

test_that("we can take logarithms units", {
  x <- 1:4
  ux <- x * as_units("m")
  
  expect_equal(as.numeric(log(ux)), log(x))
  expect_equal(units(log(ux)), units(as_units("ln(m)")))
  expect_equal(as.character(units(log(ux))), "ln(m)")

  expect_equal(as.numeric(log(ux, base = 2)), log(x, base = 2))
  expect_equal(units(log(ux, base = 2)), units(as_units("lb(m)")))
  expect_equal(as.character(units(log(ux, base = 2))), "lb(m)")

  expect_equal(as.numeric(log(ux, base = 10)), log(x, base = 10))
  expect_equal(units(log(ux, base = 10)), units(as_units("lg(m)")))
  expect_equal(as.character(units(log(ux, base = 10))), "lg(m)")
})

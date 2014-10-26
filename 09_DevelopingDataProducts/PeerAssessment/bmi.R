# Unit type
KG_M = 1    # kg & m
LB_IN = 2   # lb & in

bmi <- function(mass, height, units) {
  bmi <- mass / height^2
  if (units == LB_IN) {
    bmi <- bmi * 703
  }
  return (bmi)
}
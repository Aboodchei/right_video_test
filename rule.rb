class Rule
  def applicable?(checkout); end

  def apply!(checkout); end

  def check_applicability_and_apply!(checkout)
    apply!(checkout) if applicable?(checkout)
  end

  def <=>(other)
    # allow sorting from highest priorty to lowest priority
    # in order to keep getting consistent results regardless of
    # the order rules are inputted into a checkout
    other.class::PRIORITY <=> self.class::PRIORITY
  end
end
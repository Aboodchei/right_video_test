class Rule
  def applicable?(checkout); end

  def apply!(checkout); end

  def check_applicability_and_apply!(checkout)
    apply!(checkout) if applicable?(checkout)
  end
end
module BookingsHelper

  def refund_or_pay(float)
    float >= 0 ? "Pay >>" : "Refund >>"
  end
end

package model;

import java.util.Date;

public class Payment {
	private Long Id;
    private Double Amount;
    private Date PaymentDate;
    private String PaymentMethod;
    private Long ReservationId;

    // Default constructor
    public Payment() {
    }

    // Parameterized constructor
    public Payment(Long id, Double amount, Date paymentDate, String paymentMethod, Long reservationId) {
        this.Id = id;
        this.Amount = amount;
        this.PaymentDate = paymentDate;
        this.PaymentMethod = paymentMethod;
        this.ReservationId = reservationId;
    }

    // Getters and Setters
    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        this.Id = id;
    }

    public Double getAmount() {
        return Amount;
    }

    public void setAmount(Double amount) {
        this.Amount = amount;
    }

    public Date getPaymentDate() {
        return PaymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.PaymentDate = paymentDate;
    }

    public String getPaymentMethod() {
        return PaymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.PaymentMethod = paymentMethod;
    }

    public Long getReservationId() {
        return ReservationId;
    }

    public void setReservationId(Long reservationId) {
        this.ReservationId = reservationId;
    }

    @Override
    public String toString() {
        return "Payment [Id=" + Id + ", Amount=" + Amount + ", PaymentDate=" + PaymentDate + ", PaymentMethod=" + PaymentMethod + ", ReservationId=" + ReservationId + "]";
    }
}

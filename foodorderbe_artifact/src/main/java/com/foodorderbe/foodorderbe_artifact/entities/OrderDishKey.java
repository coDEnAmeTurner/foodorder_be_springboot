package com.foodorderbe.foodorderbe_artifact.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class OrderDishKey implements Serializable {
    @Column(name = "orderId")
    private int orderId;

    @Column(name = "dishId")
    private int dishId;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getDishId() {
        return dishId;
    }

    public void setDishId(int dishId) {
        this.dishId = dishId;
    }

    public OrderDishKey() {
    }

    public OrderDishKey(int orderId, int dishId) {
        this.orderId = orderId;
        this.dishId = dishId;
    }

    
}

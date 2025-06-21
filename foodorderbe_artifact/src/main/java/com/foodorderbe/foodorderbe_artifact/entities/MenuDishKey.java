package com.foodorderbe.foodorderbe_artifact.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class MenuDishKey implements Serializable {
    @Column(name = "menuId")
    public int menuId;

    @Column(name = "dishId")
    public int dishId;

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public int getDishId() {
        return dishId;
    }

    public void setDishId(int dishId) {
        this.dishId = dishId;
    }

    public MenuDishKey() {
    }

    public MenuDishKey(int menuId, int dishId) {
        this.menuId = menuId;
        this.dishId = dishId;
    }

    
}
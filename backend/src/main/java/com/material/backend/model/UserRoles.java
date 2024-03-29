package com.material.backend.model;

import java.util.Date;

public class UserRoles {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user_roles.id
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user_roles.user_id
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    private Integer userId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user_roles.role_id
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    private Integer roleId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user_roles.created_at
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    private Date createdAt;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user_roles.updated_at
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    private Date updatedAt;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user_roles.id
     *
     * @return the value of user_roles.id
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user_roles.id
     *
     * @param id the value for user_roles.id
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user_roles.user_id
     *
     * @return the value of user_roles.user_id
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user_roles.user_id
     *
     * @param userId the value for user_roles.user_id
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user_roles.role_id
     *
     * @return the value of user_roles.role_id
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user_roles.role_id
     *
     * @param roleId the value for user_roles.role_id
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user_roles.created_at
     *
     * @return the value of user_roles.created_at
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public Date getCreatedAt() {
        return createdAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user_roles.created_at
     *
     * @param createdAt the value for user_roles.created_at
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user_roles.updated_at
     *
     * @return the value of user_roles.updated_at
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public Date getUpdatedAt() {
        return updatedAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user_roles.updated_at
     *
     * @param updatedAt the value for user_roles.updated_at
     *
     * @mbg.generated Fri May 20 17:45:33 CST 2022
     */
    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}
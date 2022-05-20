package com.material.backend.mapper;

import com.material.backend.model.RoleRights;
import com.material.backend.model.RoleRightsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface RoleRightsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    long countByExample(RoleRightsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    int deleteByExample(RoleRightsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    int insert(RoleRights row);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    int insertSelective(RoleRights row);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    List<RoleRights> selectByExampleWithRowbounds(RoleRightsExample example, RowBounds rowBounds);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    List<RoleRights> selectByExample(RoleRightsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    RoleRights selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    int updateByExampleSelective(@Param("row") RoleRights row, @Param("example") RoleRightsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    int updateByExample(@Param("row") RoleRights row, @Param("example") RoleRightsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    int updateByPrimaryKeySelective(RoleRights row);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table role_rights
     *
     * @mbg.generated Sun May 15 23:30:03 CST 2022
     */
    int updateByPrimaryKey(RoleRights row);
}
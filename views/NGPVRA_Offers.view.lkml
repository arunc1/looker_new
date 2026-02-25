view: NGPVRA_Offers
{
  derived_table: {
    sql:SELECT
        session_id,
        MAX(currency) AS currency,
        MAX(IneligibleReason) AS IneligibleReason ,
        MAX(Original_Price) AS Original_Price,
        MAX(IF(step = '1', offerId, NULL)) AS offer_1,
        MAX(IF(step = '2', offerId, NULL)) AS offer_2,
        MAX(IF(step = '3', offerId, NULL)) AS offer_3,
        MAX(IF(step = '4', offerId, NULL)) AS offer_4,
        MAX(IF(step = '1', concat(offer_type,"-",coalesce(Discount_percentage,"")), NULL)) AS offer1type,
        MAX(IF(step = '2', concat(offer_type,"-",coalesce(Discount_percentage,"")), NULL)) AS offer2type,
        MAX(IF(step = '3', concat(offer_type,"-",coalesce(Discount_percentage,"")), NULL)) AS offer3type,
        MAX(IF(step = '4', concat(offer_type,"-",coalesce(Discount_percentage,"")), NULL)) AS offer4type,
        MAX(IF(SAFE_CAST(step as INT64) = 1,"Yes","NO")) AS offer_1Pr,
        MAX(IF(SAFE_CAST(step as INT64) > 1,"Yes","NO")) AS offer_2Pr,
        MAX(IF(SAFE_CAST(step as INT64) > 2,"Yes","NO")) AS offer_3Pr,
        MAX(IF(SAFE_CAST(step as INT64) > 3,"Yes","NO")) AS offer_4Pr
      FROM `support-df-cx-26hwzn7k.df_cx_iva_eu.NGPVRA_Offer_Details`
      GROUP BY
      session_id;;
  }

  dimension: session_id {
    label: "Conversation id"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: Original_Price {
    label: "Original_Price"
    type: number
    sql: SAFE_CAST( ${TABLE}.Original_Price AS FLOAT64 ) ;;
  }

  dimension: Currency {
    label: "Currency"
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: Ineligible_Reason {
    label: "NGP_IneligibleReason"
    type: string
    sql: ${TABLE}.IneligibleReason ;;
  }

  dimension: Offer1 {
    label: "Offer1"
    type: string
    sql: ${TABLE}.offer_1 ;;
  }

  dimension: Offer2 {
    label: "Offer2"
    type: string
    sql: ${TABLE}.offer_2 ;;
  }

  dimension: Offer3 {
    label: "Offer3"
    type: string
    sql: ${TABLE}.offer_3 ;;
  }

  dimension: Offer4 {
    label: "Offer4"
    type: string
    sql: ${TABLE}.offer_4 ;;
  }


  dimension: Offer1type {
    label: "Offer1Ty"
    type: string
    sql: ${TABLE}.offer1type ;;
  }

  dimension: Offer2type {
    label: "Offer2Ty"
    type: string
    sql: ${TABLE}.offer2type ;;
  }

  dimension: Offer3type {
    label: "Offer3Ty"
    type: string
    sql: ${TABLE}.offer3type ;;
  }

  dimension: Offer4type {
    label: "Offer4Ty"
    type: string
    sql: ${TABLE}.offer4type ;;
  }


}

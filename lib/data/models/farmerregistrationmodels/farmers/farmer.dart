class Farmer {
  final int farmerId;
  final String idNo;
  final String? oldNrc;
  final bool nrcChanged;
  final String? farmerNo;
  final int? nfrRegistrationStatusId;
  final int registrationStatusId;
  final String farmerName;
  final bool? farmerTheRespodent;
  final String? respondentName;
  final int? respondentRlshpId;
  final String? respondentMobile;
  final String? respNationalId;
  final int nfrFarmerStatusId;
  final int? farmerStatusId;
  final int farmerTypeId;
  final DateTime? dateOfRegistration;
  final String? villageName;
  final int? constituencyId;
  final int? divisionId;
  final int? sublocationId;
  final int? wardId;
  final String? enumerationAreaNumber;
  final String? shoppingCenter;
  final int gender;
  final String? email;
  final String? mobile;
  final int? dob;
  final String? postalAddress;
  final String? postalCode;
  final int? educationLevelId;
  final double? cultivatedSizeHa;
  final bool? cropProd;
  final bool? livestockProd;
  final bool? fishFarming;
  final int? livelihoodSourceId;
  final int? labourSourceId;
  final int? agriSkillsId;
  final int? agriInfoSourceId;
  final bool? gokFertiliser;
  final bool? limeUsage;
  final int? certifiedSeedUse;
  final bool? cropsInsurance;
  final bool? livestockInsurance;
  final bool? fishInsurance;
  final double? farmingIncomePercent;
  final bool? assetsInsurance;
  final bool? farmRecords;
  final bool? irrigationUse;
  final double? irrigationArea;
  final bool? cooperativeGroup;
  final int? extensionsericeAccess;
  final int? organizationId;
  final String? enumeratorName;
  final String? enumeratorId;
  final String? enumeratorMobile;
  final DateTime dateCreated;
  final int? createdBy;
  final DateTime? dateCaptured;
  final int? approvedBy;
  final DateTime? dateApproved;
  final int? editedBy;
  final DateTime? dateEdited;
  final int? editApprovedBy;
  final DateTime? dateEditApproved;
  final String? cooperativeSociety;
  final int? maritalStatusId;
  final int? avgAnnualHouseholdIncome;
  final int? monthlyHhExpenditure;
  final int? dataSourceId;
  final int? hhSize;
  final bool? formalAgriTraining;
  final String? accountNo;
  final int approvedList;
  final DateTime? dateApprovedList;
  final DateTime? dateOfConflict;
  final DateTime? dateRequestedForDelete;
  final DateTime? dateDeleted;
  final int? campChangeRequestStatus;
  final String? comments;
  final DateTime? startOfRegistration;
  final DateTime? endOfRegistration;

  Farmer({
    required this.farmerId,
    required this.idNo,
    this.oldNrc,
    required this.nrcChanged,
    this.farmerNo,
    this.nfrRegistrationStatusId,
    required this.registrationStatusId,
    required this.farmerName,
    this.farmerTheRespodent,
    this.respondentName,
    this.respondentRlshpId,
    this.respondentMobile,
    this.respNationalId,
    required this.nfrFarmerStatusId,
    this.farmerStatusId,
    required this.farmerTypeId,
    this.dateOfRegistration,
    this.villageName,
    this.constituencyId,
    this.divisionId,
    this.sublocationId,
    this.wardId,
    this.enumerationAreaNumber,
    this.shoppingCenter,
    required this.gender,
    this.email,
    this.mobile,
    this.dob,
    this.postalAddress,
    this.postalCode,
    this.educationLevelId,
    this.cultivatedSizeHa,
    this.cropProd,
    this.livestockProd,
    this.fishFarming,
    this.livelihoodSourceId,
    this.labourSourceId,
    this.agriSkillsId,
    this.agriInfoSourceId,
    this.gokFertiliser,
    this.limeUsage,
    this.certifiedSeedUse,
    this.cropsInsurance,
    this.livestockInsurance,
    this.fishInsurance,
    this.farmingIncomePercent,
    this.assetsInsurance,
    this.farmRecords,
    this.irrigationUse,
    this.irrigationArea,
    this.cooperativeGroup,
    this.extensionsericeAccess,
    this.organizationId,
    this.enumeratorName,
    this.enumeratorId,
    this.enumeratorMobile,
    required this.dateCreated,
    this.createdBy,
    this.dateCaptured,
    this.approvedBy,
    this.dateApproved,
    this.editedBy,
    this.dateEdited,
    this.editApprovedBy,
    this.dateEditApproved,
    this.cooperativeSociety,
    this.maritalStatusId,
    this.avgAnnualHouseholdIncome,
    this.monthlyHhExpenditure,
    this.dataSourceId,
    this.hhSize,
    this.formalAgriTraining,
    this.accountNo,
    required this.approvedList,
    this.dateApprovedList,
    this.dateOfConflict,
    this.dateRequestedForDelete,
    this.dateDeleted,
    this.campChangeRequestStatus,
    this.comments,
    this.startOfRegistration,
    this.endOfRegistration,
  });

  factory Farmer.fromSqfliteDatabase(Map<String, dynamic> map) => Farmer(
        farmerId: map['farmer_id']?.toInt() ?? 0,
        idNo: map['id_no'] ?? '',
        oldNrc: map['old_nrc'],
        nrcChanged: (map['nrc_changed'] ?? 0) == 1,
        farmerNo: map['farmer_no'],
        nfrRegistrationStatusId: map['nfr_registration_status_id']?.toInt(),
        registrationStatusId: map['registration_status_id']?.toInt() ?? 0,
        farmerName: map['farmer_name'] ?? '',
        farmerTheRespodent: map['farmer_the_respodent'],
        respondentName: map['respondent_name'],
        respondentRlshpId: map['respondent_rlshp_id']?.toInt(),
        respondentMobile: map['respondent_mobile'],
        respNationalId: map['resp_national_id'],
        nfrFarmerStatusId: map['nfr_farmer_status_id']?.toInt() ?? 0,
        farmerStatusId: map['farmer_status_id']?.toInt(),
        farmerTypeId: map['farmer_type_id']?.toInt() ?? 0,
        dateOfRegistration: DateTime.parse(map['date_of_registration'] ?? ''),
        villageName: map['village_name'],
        constituencyId: map['constituency_id']?.toInt(),
        divisionId: map['division_id']?.toInt(),
        sublocationId: map['sublocation_id']?.toInt(),
        wardId: map['ward_id']?.toInt(),
        enumerationAreaNumber: map['enumeration_area_number'],
        shoppingCenter: map['shopping_center'],
        gender: map['gender']?.toInt() ?? 0,
        email: map['email'],
        mobile: map['mobile'],
        dob: map['dob']?.toInt(),
        postalAddress: map['postal_address'],
        postalCode: map['postal_code'],
        educationLevelId: map['education_level_id']?.toInt(),
        cultivatedSizeHa: map['cultivated_size_ha']?.toDouble(),
        cropProd: map['crop_prod'],
        livestockProd: map['livestock_prod'],
        fishFarming: map['fish_farming'],
        livelihoodSourceId: map['livelihood_source_id']?.toInt(),
        labourSourceId: map['labour_source_id']?.toInt(),
        agriSkillsId: map['agri_skills_id']?.toInt(),
        agriInfoSourceId: map['agri_info_source_id']?.toInt(),
        gokFertiliser: map['gok_fertiliser'],
        limeUsage: map['lime_usage'],
        certifiedSeedUse: map['certified_seed_use']?.toInt(),
        cropsInsurance: map['crops_insurance'],
        livestockInsurance: map['livestock_insurance'],
        fishInsurance: map['fish_insurance'],
        farmingIncomePercent: map['farming_income_percent']?.toDouble(),
        assetsInsurance: map['assets_insurance'],
        farmRecords: map['farm_records'],
        irrigationUse: map['irrigation_use'],
        irrigationArea: map['irrigation_area']?.toDouble(),
        cooperativeGroup: map['cooperative_group'],
        extensionsericeAccess: map['extensionserice_access']?.toInt(),
        organizationId: map['organization_id']?.toInt(),
        enumeratorName: map['enumerator_name'],
        enumeratorId: map['enumerator_id'],
        enumeratorMobile: map['enumerator_mobile'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
        dateCaptured: DateTime.parse(map['date_captured'] ?? ''),
        approvedBy: map['approved_by']?.toInt(),
        dateApproved: DateTime.parse(map['date_approved'] ?? ''),
        editedBy: map['edited_by']?.toInt(),
        dateEdited: DateTime.parse(map['date_edited'] ?? ''),
        editApprovedBy: map['edit_approved_by']?.toInt(),
        dateEditApproved: DateTime.parse(map['date_edit_approved'] ?? ''),
        cooperativeSociety: map['cooperative_society'],
        maritalStatusId: map['marital_status_id']?.toInt(),
        avgAnnualHouseholdIncome: map['avg_annual_household_income']?.toInt(),
        monthlyHhExpenditure: map['monthly_hh_expenditure']?.toInt(),
        dataSourceId: map['data_source_id']?.toInt(),
        hhSize: map['hh_size']?.toInt(),
        formalAgriTraining: map['formal_agri_training'],
        accountNo: map['account_no'],
        approvedList: map['approved_list']?.toInt() ?? 0,
        dateApprovedList: DateTime.parse(map['date_approved_list'] ?? ''),
        dateOfConflict: DateTime.parse(map['date_of_conflict'] ?? ''),
        dateRequestedForDelete:
            DateTime.parse(map['date_requested_for_delete'] ?? ''),
        dateDeleted: DateTime.parse(map['date_deleted'] ?? ''),
        campChangeRequestStatus: map['camp_change_request_status']?.toInt(),
        comments: map['comments'],
        startOfRegistration: DateTime.parse(map['start_of_registration'] ?? ''),
        endOfRegistration: DateTime.parse(map['end_of_registration'] ?? ''),
      );
}

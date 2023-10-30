class Farmer {
  final int farmerId;
  final String? idNo;
  final String? oldNrc;
  final bool? nrcChanged;
  final String? farmerNo;
  final int? nfrRegistrationStatusId;
  final int? registrationStatusId;
  final String farmerName;
  final bool? farmerTheRespodent;
  final String? respondentName;
  final int? respondentRlshpId;
  final String? respondentMobile;
  final String? respNationalId;
  final int? nfrFarmerStatusId;
  final int? farmerStatusId;
  final int? farmerTypeId;
  final DateTime? dateOfRegistration;
  final String? villageName;
  final int? constituencyId;
  final int? divisionId;
  final int? sublocationId;
  final int? wardId;
  final String? enumerationAreaNumber;
  final String? shoppingCenter;
  final int? gender;
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
  final int? enumeratorId;
  final String? enumeratorMobile;
  final DateTime? dateCreated;
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
  final int? approvedList;
  final DateTime? dateApprovedList;
  final DateTime? dateOfConflict;
  final DateTime? dateRequestedForDelete;
  final DateTime? dateDeleted;
  final int? campChangeRequestStatus;
  final String? comments;
  final DateTime? startOfRegistration;
  final DateTime? endOfRegistration;
  final bool? completed;

  Farmer({
    required this.farmerId,
    this.idNo,
    this.oldNrc,
    this.nrcChanged,
    this.farmerNo,
    this.nfrRegistrationStatusId,
    this.registrationStatusId,
    required this.farmerName,
    this.farmerTheRespodent,
    this.respondentName,
    this.respondentRlshpId,
    this.respondentMobile,
    this.respNationalId,
    this.nfrFarmerStatusId,
    this.farmerStatusId,
    this.farmerTypeId,
    this.dateOfRegistration,
    this.villageName,
    this.constituencyId,
    this.divisionId,
    this.sublocationId,
    this.wardId,
    this.enumerationAreaNumber,
    this.shoppingCenter,
    this.gender,
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
    this.dateCreated,
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
    this.approvedList,
    this.dateApprovedList,
    this.dateOfConflict,
    this.dateRequestedForDelete,
    this.dateDeleted,
    this.campChangeRequestStatus,
    this.comments,
    this.startOfRegistration,
    this.endOfRegistration,
    this.completed,
  });

  factory Farmer.fromSqfliteDatabase(Map<String, dynamic> map) => Farmer(
        farmerId: map['farmerId']?.toInt() ?? 0,
        idNo: map['idNo'] ?? '',
        oldNrc: map['oldNrc'],
        nrcChanged: (map['nrcChanged'] ?? 0) == 1,
        farmerNo: map['farmerNo'],
        nfrRegistrationStatusId: map['nfrRegistrationStatusId']?.toInt(),
        registrationStatusId: map['registrationStatusId']?.toInt() ?? 0,
        farmerName: map['farmerName'] ?? '',
        farmerTheRespodent: map['farmerTheRespodent'] == 1,
        respondentName: map['respondentName'],
        respondentRlshpId: map['respondentRlshpId']?.toInt(),
        respondentMobile: map['respondentMobile'],
        respNationalId: map['respNationalId'],
        nfrFarmerStatusId: map['nfrFarmerStatusId']?.toInt() ?? 0,
        farmerStatusId: map['farmerStatusId']?.toInt(),
        farmerTypeId: map['farmerTypeId']?.toInt() ?? 0,
        villageName: map['villageName'],
        constituencyId: map['constituencyId']?.toInt(),
        divisionId: map['divisionId']?.toInt(),
        sublocationId: map['sublocationId']?.toInt(),
        wardId: map['wardId']?.toInt(),
        enumerationAreaNumber: map['enumerationAreaNumber'],
        shoppingCenter: map['shoppingCenter'],
        gender: map['gender']?.toInt() ?? 0,
        email: map['email'],
        mobile: map['mobile'],
        dob: map['dob']?.toInt(),
        postalAddress: map['postalAddress'],
        postalCode: map['postalCode'],
        educationLevelId: map['educationLevelId']?.toInt(),
        cultivatedSizeHa: map['cultivatedSizeHa']?.toDouble(),
        cropProd: map['cropProd'] == 1,
        livestockProd: map['livestockProd'] == 1,
        fishFarming: map['fishFarming'] == 1,
        livelihoodSourceId: map['livelihoodSourceId']?.toInt(),
        labourSourceId: map['labourSourceId']?.toInt(),
        agriSkillsId: map['agriSkillsId']?.toInt(),
        agriInfoSourceId: map['agriInfoSourceId']?.toInt(),
        gokFertiliser: map['gokFertiliser'],
        limeUsage: map['limeUsage'],
        certifiedSeedUse: map['certifiedSeedUse']?.toInt(),
        cropsInsurance: map['cropsInsurance'],
        livestockInsurance: map['livestockInsurance'],
        fishInsurance: map['fishInsurance'],
        farmingIncomePercent: map['farmingIncomePercent']?.toDouble(),
        assetsInsurance: map['assetsInsurance'],
        farmRecords: map['farmRecords'],
        irrigationUse: map['irrigationUse'],
        irrigationArea: map['irrigationArea']?.toDouble(),
        cooperativeGroup: map['cooperativeGroup'] == 1,
        extensionsericeAccess: map['extensionsericeAccess']?.toInt(),
        organizationId: map['organizationId']?.toInt(),
        enumeratorName: map['enumeratorName'],
        enumeratorId: map['enumeratorId'],
        enumeratorMobile: map['enumeratorMobile'],
        createdBy: map['createdBy'] ?? 0,
        approvedBy: map['approvedBy']?.toInt(),
        editedBy: map['editedBy']?.toInt(),
        editApprovedBy: map['editApprovedBy']?.toInt(),
        cooperativeSociety: map['cooperativeSociety'],
        maritalStatusId: map['maritalStatusId']?.toInt(),
        avgAnnualHouseholdIncome: map['avgAnnualHouseholdIncome']?.toInt(),
        monthlyHhExpenditure: map['monthlyHhExpenditure']?.toInt(),
        dataSourceId: map['dataSourceId']?.toInt(),
        hhSize: map['hhSize']?.toInt(),
        formalAgriTraining: map['formalAgriTraining'],
        accountNo: map['accountNo'],
        approvedList: map['approvedList']?.toInt() ?? 0,
        campChangeRequestStatus: map['campChangeRequestStatus']?.toInt(),
        comments: map['comments'],
        completed: map['completed'] == 1,
      );

  Map<String, dynamic> toJson() {
    return {
      'farmerId': farmerId,
      'idNo': idNo,
      'oldNrc': oldNrc,
      'nrcChanged': nrcChanged,
      'farmerNo': farmerNo,
      'nfrRegistrationStatusId': nfrRegistrationStatusId,
      'registrationStatusId': registrationStatusId,
      'farmerName': farmerName,
      'farmerTheRespodent': farmerTheRespodent,
      'respondentName': respondentName,
      'respondentRlshpId': respondentRlshpId,
      'respondentMobile': respondentMobile,
      'respNationalId': respNationalId,
      'nfrFarmerStatusId': nfrFarmerStatusId,
      'farmerStatusId': farmerStatusId,
      'farmerTypeId': farmerTypeId,
      'dateOfRegistration': dateOfRegistration?.toIso8601String(),
      'villageName': villageName,
      'constituencyId': constituencyId,
      'divisionId': divisionId,
      'sublocationId': sublocationId,
      'wardId': wardId,
      'enumerationAreaNumber': enumerationAreaNumber,
      'shoppingCenter': shoppingCenter,
      'gender': gender,
      'email': email,
      'mobile': mobile,
      'dob': dob,
      'postalAddress': postalAddress,
      'postalCode': postalCode,
      'educationLevelId': educationLevelId,
      'cultivatedSizeHa': cultivatedSizeHa,
      'cropProd': cropProd,
      'livestockProd': livestockProd,
      'fishFarming': fishFarming,
      'livelihoodSourceId': livelihoodSourceId,
      'labourSourceId': labourSourceId,
      'agriSkillsId': agriSkillsId,
      'agriInfoSourceId': agriInfoSourceId,
      'gokFertiliser': gokFertiliser,
      'limeUsage': limeUsage,
      'certifiedSeedUse': certifiedSeedUse,
      'cropsInsurance': cropsInsurance,
      'livestockInsurance': livestockInsurance,
      'fishInsurance': fishInsurance,
      'farmingIncomePercent': farmingIncomePercent,
      'assetsInsurance': assetsInsurance,
      'farmRecords': farmRecords,
      'irrigationUse': irrigationUse,
      'irrigationArea': irrigationArea,
      'cooperativeGroup': cooperativeGroup,
      'extensionsericeAccess': extensionsericeAccess,
      'organizationId': organizationId,
      'enumeratorName': enumeratorName,
      'enumeratorId': enumeratorId,
      'enumeratorMobile': enumeratorMobile,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
      'dateCaptured': dateCaptured?.toIso8601String(),
      'approvedBy': approvedBy,
      'dateApproved': dateApproved?.toIso8601String(),
      'editedBy': editedBy,
      'dateEdited': dateEdited?.toIso8601String(),
      'editApprovedBy': editApprovedBy,
      'dateEditApproved': dateEditApproved?.toIso8601String(),
      'cooperativeSociety': cooperativeSociety,
      'maritalStatusId': maritalStatusId,
      'avgAnnualHouseholdIncome': avgAnnualHouseholdIncome,
      'monthlyHhExpenditure': monthlyHhExpenditure,
      'dataSourceId': dataSourceId,
      'hhSize': hhSize,
      'formalAgriTraining': formalAgriTraining,
      'accountNo': accountNo,
      'approvedList': approvedList,
      'dateApprovedList': dateApprovedList?.toIso8601String(),
      'dateOfConflict': dateOfConflict?.toIso8601String(),
      'dateRequestedForDelete': dateRequestedForDelete?.toIso8601String(),
      'dateDeleted': dateDeleted?.toIso8601String(),
      'campChangeRequestStatus': campChangeRequestStatus,
      'comments': comments,
      'startOfRegistration': startOfRegistration?.toIso8601String(),
      'endOfRegistration': endOfRegistration?.toIso8601String(),
    };
  }
}

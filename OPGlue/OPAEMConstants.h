/*
 * OPAEMConstants.h
 * /Applications/OmniPlan.app
 * osaglue 0.5.2
 *
 */

#import <Foundation/Foundation.h>
#import "Appscript/Appscript.h"

/* Types, enumerators, properties */

enum {
    kOPActivityOnArrowPERT = 'OPc2',
    kOPActivityOnNodePERT = 'OPc1',
    kOPApplicationResponses = 'rmte',
    kOPAsk = 'ask ',
    kOPBothViews = 'OPv0',
    kOPCase_ = 'case',
    kOPCloseToDueDate = 'OPTc',
    kOPDailyScheduling = 'OPS2',
    kOPDetailed = 'lwdt',
    kOPDiacriticals = 'diac',
    kOPDueNow = 'OPTd',
    kOPEquipment = 'OPRe',
    kOPExactScheduling = 'OPS0',
    kOPExpansion = 'expa',
    kOPFinished = 'OPTm',
    kOPFinishfinish = 'ODff',
    kOPFinishstart = 'ODfs',
    kOPGanttOnly = 'OPv1',
    kOPGroupTask = 'OPTG',
    kOPHourlyScheduling = 'OPS1',
    kOPHyphens = 'hyph',
    kOPMaterial = 'OPRm',
    kOPMilestoneTask = 'OPTM',
    kOPNo = 'no  ',
    kOPNumericStrings = 'nume',
    kOPOk = 'OPTo',
    kOPOutlineOnly = 'OPv2',
    kOPPastDue = 'OPTp',
    kOPPerson = 'OPRs',
    kOPPunctuation = 'punc',
    kOPResourceGroup = 'OPRg',
    kOPStandard = 'lwst',
    kOPStandardTask = 'OPTS',
    kOPStartfinish = 'ODsf',
    kOPStartstart = 'ODss',
    kOPWhitespace = 'whit',
    kOPWorkBreakdownStructure = 'OPc0',
    kOPYes = 'yes ',
    kOPApril = 'apr ',
    kOPAugust = 'aug ',
    kOPDecember = 'dec ',
    kOPEPSPicture = 'EPS ',
    kOPFebruary = 'feb ',
    kOPFriday = 'fri ',
    kOPGIFPicture = 'GIFf',
    kOPJPEGPicture = 'JPEG',
    kOPJanuary = 'jan ',
    kOPJuly = 'jul ',
    kOPJune = 'jun ',
    kOPMarch = 'mar ',
    kOPMay = 'may ',
    kOPMonday = 'mon ',
    kOPNovember = 'nov ',
    kOPOctober = 'oct ',
    kOPPICTPicture = 'PICT',
    kOPRGB16Color = 'tr16',
    kOPRGB96Color = 'tr96',
    kOPRGBColor = 'cRGB',
    kOPSaturday = 'sat ',
    kOPSeptember = 'sep ',
    kOPSunday = 'sun ',
    kOPTIFFPicture = 'TIFF',
    kOPThursday = 'thu ',
    kOPTuesday = 'tue ',
    kOPWednesday = 'wed ',
    kOPActions = 'OPac',
    kOPAddressId = 'Orai',
    kOPAlias = 'alis',
    kOPAnything = '****',
    kOPApplication = 'capp',
    kOPApplicationBundleID = 'bund',
    kOPApplicationSignature = 'sign',
    kOPApplicationURL = 'aprl',
    kOPAssignment = 'Opas',
    kOPAttachment = 'atts',
    kOPAttribute = 'OSsa',
    kOPAttributeRun = 'catr',
    kOPAvailableTemplates = 'OPAT',
    kOPBaseStyle = 'OPbs',
    kOPBest = 'best',
    kOPBoolean = 'bool',
    kOPBoundingRectangle = 'qdrt',
    kOPBounds = 'pbnd',
    kOPCalendarColumns = 'OPCC',
    kOPCalendarDaySchedule = 'OPse',
    kOPCanRedo = 'Odcr',
    kOPCanUndo = 'Odcu',
    kOPCentimeters = 'cmtr',
    kOPCharacter = 'cha ',
    kOPChildResource = 'Opcr',
    kOPChildTask = 'Opct',
    kOPClassInfo = 'gcli',
    kOPClass_ = 'pcls',
    kOPCloseable = 'hclb',
    kOPCode = 'OPcc',
    kOPCollating = 'lwcl',
    kOPColor = 'cRGB',
    kOPColorTable = 'clrt',
    kOPColumnTitleStyle = 'OPtS',
    kOPCompleted = 'OPco',
    kOPCompletedEffort = 'Otce',
    kOPCompletedTaskStyle = 'OPcS',
    kOPContainer = 'ctnr',
    kOPCopies = 'lwcp',
    kOPCostPerHour = 'OPCh',
    kOPCostPerUse = 'OPCu',
    kOPCritical = 'OPcp',
    kOPCubicCentimeters = 'ccmt',
    kOPCubicFeet = 'cfet',
    kOPCubicInches = 'cuin',
    kOPCubicMeters = 'cmet',
    kOPCubicYards = 'cyrd',
    kOPCurrency = 'OPcu',
    kOPCustomData = 'Opcd',
    kOPCustomDataEntry = 'OPCP',
    kOPDashStyle = 'tdas',
    kOPData = 'rdat',
    kOPDate = 'ldt ',
    kOPDecimalStruct = 'decm',
    kOPDefaultTemplate = 'OPDT',
    kOPDefaultValue = 'OSdv',
    kOPDefiningStyle = 'OSds',
    kOPDegreesCelsius = 'degc',
    kOPDegreesFahrenheit = 'degf',
    kOPDegreesKelvin = 'degk',
    kOPDependency = 'Opdp',
    kOPDependencyType = 'OPdk',
    kOPDependent = 'Opds',
    kOPDependentTask = 'Opdd',
    kOPDiagramType = 'OPCt',
    kOPDocument = 'docu',
    kOPDoubleInteger = 'comp',
    kOPDuration = 'Otdu',
    kOPEfficiency = 'OPef',
    kOPEffort = 'Otef',
    kOPElementInfo = 'elin',
    kOPEmailAddress = 'Orem',
    kOPEncodedString = 'encs',
    kOPEndTime = 'OPpe',
    kOPEndingBaselineDate = 'Otep',
    kOPEndingBaselineVariance = 'Otev',
    kOPEndingConstraintDate = 'Otec',
    kOPEndingDate = 'Oped',
    kOPEndingDateLocked = 'Otel',
    kOPEndingPage = 'lwlp',
    kOPEnumerator = 'enum',
    kOPErrorHandling = 'lweh',
    kOPEventInfo = 'evin',
    kOPExpanded = 'Opex',
    kOPExportSettings = 'OPEc',
    kOPExtendedFloat = 'exte',
    kOPFaxNumber = 'faxn',
    kOPFeet = 'feet',
    kOPFile = 'file',
    kOPFileOrListOfFile = 'cct0',
    kOPFileOrText = 'cct2',
    kOPFileRef = 'fsrf',
    kOPFileSpecification = 'fss ',
    kOPFileURL = 'furl',
    kOPFiltered = 'Opfo',
    kOPFixed = 'fixd',
    kOPFixedPoint = 'fpnt',
    kOPFixedRectangle = 'frct',
    kOPFloat128bit = 'ldbl',
    kOPFloat_ = 'doub',
    kOPFont = 'font',
    kOPFrontmost = 'pisf',
    kOPGallons = 'galn',
    kOPGanttBackgroundColor = 'Opgb',
    kOPGanttCriticalPathColor = 'Opgc',
    kOPGanttDateScaleSeparatorColor = 'Opgs',
    kOPGanttOffDayColor = 'Opgo',
    kOPGanttResourceDependencyLineColor = 'Opgr',
    kOPGanttTaskDependencyLineColor = 'Opgd',
    kOPGanttTodayColor = 'Opgt',
    kOPGrams = 'gram',
    kOPGraphicText = 'cgtx',
    kOPGroup = 'Orpa',
    kOPGroupTaskStyle = 'OPtS',
    kOPHasOverview = 'OPOV',
    kOPHtml = 'OPht',
    kOPICalTodo = 'OPit',
    kOPId_ = 'ID  ',
    kOPInches = 'inch',
    kOPIncludeTaskGroups = 'OPig',
    kOPIndex = 'pidx',
    kOPInteger = 'long',
    kOPInternationalText = 'itxt',
    kOPInternationalWritingCode = 'intl',
    kOPItem = 'cobj',
    kOPKernelProcessID = 'kpid',
    kOPKilograms = 'kgrm',
    kOPKilometers = 'kmtr',
    kOPLeadPercentage = 'OPlp',
    kOPLeadTime = 'OPlt',
    kOPList = 'list',
    kOPListOfFileOrSpecifier = 'cct1',
    kOPListOfSpecifierOrSpecifier = 'cct4',
    kOPLiters = 'litr',
    kOPLocationReference = 'insl',
    kOPLongFixed = 'lfxd',
    kOPLongFixedPoint = 'lfpt',
    kOPLongFixedRectangle = 'lfrc',
    kOPLongPoint = 'lpnt',
    kOPLongRectangle = 'lrct',
    kOPMachPort = 'port',
    kOPMachine = 'mach',
    kOPMachineLocation = 'mLoc',
    kOPMeters = 'metr',
    kOPMiles = 'mile',
    kOPMilestone = 'Opms',
    kOPMilestoneTaskStyle = 'OPmS',
    kOPMinimizable = 'ismn',
    kOPMinimized = 'pmnd',
    kOPMissingValue = 'msng',
    kOPModified = 'imod',
    kOPName = 'pnam',
    kOPNamedStyle = 'OSns',
    kOPNote = 'Opnt',
    kOPNoteExpanded = 'Opne',
    kOPNoteStyle = 'OPnS',
    kOPNull = 'null',
    kOPNumber = 'Orna',
    kOPOunces = 'ozs ',
    kOPOutlineDepth = 'Odep',
    kOPOutlineNumber = 'Onum',
    kOPOverdueTaskStyle = 'OPtS',
    kOPPagesAcross = 'lwla',
    kOPPagesDown = 'lwld',
    kOPParagraph = 'cpar',
    kOPParameterInfo = 'pmin',
    kOPParentTask = 'Otgr',
    kOPPixelMapRecord = 'tpmm',
    kOPPoint = 'QDpt',
    kOPPounds = 'lbs ',
    kOPPrerequisite = 'Oprq',
    kOPPrerequisiteTask = 'Oppp',
    kOPPrintSettings = 'pset',
    kOPPriority = 'Otpr',
    kOPProcessSerialNumber = 'psn ',
    kOPProject = 'OPpj',
    kOPProperties = 'pALL',
    kOPProperty = 'prop',
    kOPPropertyInfo = 'pinf',
    kOPQuarts = 'qrts',
    kOPRealOrTextOrColorOrIntegerOrListOfReal = 'cct5',
    kOPRecalculatesDuration = 'OPfe',
    kOPRecalculatesEffort = 'OPre',
    kOPRecord = 'reco',
    kOPReference = 'obj ',
    kOPRemainingEffort = 'Oter',
    kOPReserveTime = 'Otrt',
    kOPReservingTime = 'Othr',
    kOPResizable = 'prsz',
    kOPResource = 'Oprs',
    kOPResourceColumns = 'OPRC',
    kOPResourceCost = 'OPrc',
    kOPResourceStyle = 'OPrS',
    kOPResourceType = 'Orty',
    kOPRichText = 'ctxt',
    kOPRotation = 'trot',
    kOPSchedule = 'OPsc',
    kOPSchedulingGranularity = 'Opsg',
    kOPScript = 'scpt',
    kOPSelectedResources = 'OPSR',
    kOPSelectedTasks = 'OPST',
    kOPShortDescription = 'OPde',
    kOPShortFloat = 'sing',
    kOPShortInteger = 'shor',
    kOPShowAllRows = 'OPar',
    kOPSize = 'ptsz',
    kOPSpecificDate = 'OPdd',
    kOPSquareFeet = 'sqft',
    kOPSquareKilometers = 'sqkm',
    kOPSquareMeters = 'sqrm',
    kOPSquareMiles = 'sqmi',
    kOPSquareYards = 'sqyd',
    kOPStandardTaskStyle = 'OPtS',
    kOPStartTime = 'OPps',
    kOPStartingBaselineDate = 'Otsp',
    kOPStartingBaselineVariance = 'Otsv',
    kOPStartingConstraintDate = 'Otsc',
    kOPStartingDate = 'Opsd',
    kOPStartingDateLocked = 'Otsl',
    kOPStartingPage = 'lwfp',
    kOPStaticCost = 'OPSC',
    kOPString = 'TEXT',
    kOPStyle = 'OSst',
    kOPStyledClipboardText = 'styl',
    kOPStyledText = 'STXT',
    kOPSuiteInfo = 'suin',
    kOPSymbol = 'OPcs',
    kOPTargetPrinter = 'trpr',
    kOPTask = 'Optk',
    kOPTaskColumns = 'OPTC',
    kOPTaskStatus = 'OPTs',
    kOPTaskType = 'OPTT',
    kOPTemplate = 'OPTE',
    kOPTextStyleInfo = 'tsty',
    kOPTitle = 'OPti',
    kOPTotalCost = 'OPtc',
    kOPTotalSeconds = 'OPth',
    kOPTotalUses = 'OPtu',
    kOPTypeClass = 'type',
    kOPUndetermined = 'Opps',
    kOPUnicodeText = 'utxt',
    kOPUnits = 'Oaan',
    kOPUnsignedInteger = 'magn',
    kOPUtf16Text = 'ut16',
    kOPUtf8Text = 'utf8',
    kOPValue = 'OPvl',
    kOPVersion = 'vers',
    kOPVersion_ = 'vers',
    kOPViewsToInclude = 'OPev',
    kOPViolation = 'Opis',
    kOPViolationCount = 'Opec',
    kOPViolationType = 'OPty',
    kOPVisible = 'pvis',
    kOPWeekDaySchedule = 'OPsd',
    kOPWeekDayScheduleOrCalendarDaySchedule = 'cct3',
    kOPWindow = 'cwin',
    kOPWord = 'cwor',
    kOPWorkTimes = 'OPpt',
    kOPWritingCode = 'psct',
    kOPYards = 'yard',
    kOPZoomable = 'iszm',
    kOPZoomed = 'pzum',
};

enum {
    eOPApplications = 'capp',
    eOPAssignments = 'Opas',
    eOPAttachments = 'atts',
    eOPAttributeRuns = 'catr',
    eOPAttributes = 'OSsa',
    eOPCalendarDaySchedules = 'OPse',
    eOPCharacters = 'cha ',
    eOPChildResources = 'Opcr',
    eOPChildTasks = 'Opct',
    eOPCurrencies = 'OPcu',
    eOPCustomDataEntries = 'OPCP',
    eOPDependencies = 'Opdp',
    eOPDependents = 'Opds',
    eOPDocuments = 'docu',
    eOPExportSettings = 'OPEc',
    eOPFileOrListOfFile = 'cct0',
    eOPFileOrText = 'cct2',
    eOPItems = 'cobj',
    eOPListOfFileOrSpecifier = 'cct1',
    eOPListOfSpecifierOrSpecifier = 'cct4',
    eOPMilestones = 'Opms',
    eOPNamedStyles = 'OSns',
    eOPParagraphs = 'cpar',
    eOPPrerequisites = 'Oprq',
    eOPPrintSettings = 'pset',
    eOPProjects = 'OPpj',
    eOPRealOrTextOrColorOrIntegerOrListOfReal = 'cct5',
    eOPResources = 'Oprs',
    eOPRichText = 'ctxt',
    eOPSchedules = 'OPsc',
    eOPStyles = 'OSst',
    eOPTasks = 'Optk',
    eOPViolations = 'Opis',
    eOPWeekDayScheduleOrCalendarDaySchedule = 'cct3',
    eOPWeekDaySchedules = 'OPsd',
    eOPWindows = 'cwin',
    eOPWords = 'cwor',
    pOPActions = 'OPac',
    pOPAddressId = 'Orai',
    pOPAvailableTemplates = 'OPAT',
    pOPBaseStyle = 'OPbs',
    pOPBounds = 'pbnd',
    pOPCalendarColumns = 'OPCC',
    pOPCanRedo = 'Odcr',
    pOPCanUndo = 'Odcu',
    pOPClass_ = 'pcls',
    pOPCloseable = 'hclb',
    pOPCode = 'OPcc',
    pOPCollating = 'lwcl',
    pOPColor = 'colr',
    pOPColumnTitleStyle = 'OPtS',
    pOPCompleted = 'OPco',
    pOPCompletedEffort = 'Otce',
    pOPCompletedTaskStyle = 'OPcS',
    pOPContainer = 'ctnr',
    pOPCopies = 'lwcp',
    pOPCostPerHour = 'OPCh',
    pOPCostPerUse = 'OPCu',
    pOPCritical = 'OPcp',
    pOPCurrency = 'OPcu',
    pOPCustomData = 'Opcd',
    pOPDefaultTemplate = 'OPDT',
    pOPDefaultValue = 'OSdv',
    pOPDefiningStyle = 'OSds',
    pOPDependencyType = 'OPdk',
    pOPDependentTask = 'Opdd',
    pOPDiagramType = 'OPCt',
    pOPDocument = 'docu',
    pOPDuration = 'Otdu',
    pOPEfficiency = 'OPef',
    pOPEffort = 'Otef',
    pOPEmailAddress = 'Orem',
    pOPEndTime = 'OPpe',
    pOPEndingBaselineDate = 'Otep',
    pOPEndingBaselineVariance = 'Otev',
    pOPEndingConstraintDate = 'Otec',
    pOPEndingDate = 'Oped',
    pOPEndingDateLocked = 'Otel',
    pOPEndingPage = 'lwlp',
    pOPErrorHandling = 'lweh',
    pOPExpanded = 'Opex',
    pOPFaxNumber = 'faxn',
    pOPFile = 'file',
    pOPFiltered = 'Opfo',
    pOPFont = 'font',
    pOPFrontmost = 'pisf',
    pOPGanttBackgroundColor = 'Opgb',
    pOPGanttCriticalPathColor = 'Opgc',
    pOPGanttDateScaleSeparatorColor = 'Opgs',
    pOPGanttOffDayColor = 'Opgo',
    pOPGanttResourceDependencyLineColor = 'Opgr',
    pOPGanttTaskDependencyLineColor = 'Opgd',
    pOPGanttTodayColor = 'Opgt',
    pOPGroup = 'Orpa',
    pOPGroupTaskStyle = 'OPtS',
    pOPHasOverview = 'OPOV',
    pOPHtml = 'OPht',
    pOPICalTodo = 'OPit',
    pOPId_ = 'ID  ',
    pOPIncludeTaskGroups = 'OPig',
    pOPIndex = 'pidx',
    pOPLeadPercentage = 'OPlp',
    pOPLeadTime = 'OPlt',
    pOPMilestoneTaskStyle = 'OPmS',
    pOPMinimizable = 'ismn',
    pOPMinimized = 'pmnd',
    pOPModified = 'imod',
    pOPName = 'pnam',
    pOPNote = 'Opnt',
    pOPNoteExpanded = 'Opne',
    pOPNoteStyle = 'OPnS',
    pOPNumber = 'Orna',
    pOPOutlineDepth = 'Odep',
    pOPOutlineNumber = 'Onum',
    pOPOverdueTaskStyle = 'OPtS',
    pOPPagesAcross = 'lwla',
    pOPPagesDown = 'lwld',
    pOPParentTask = 'Otgr',
    pOPPrerequisiteTask = 'Oppp',
    pOPPriority = 'Otpr',
    pOPProject = 'OPpj',
    pOPProperties = 'pALL',
    pOPRecalculatesDuration = 'OPfe',
    pOPRecalculatesEffort = 'OPre',
    pOPRemainingEffort = 'Oter',
    pOPReserveTime = 'Otrt',
    pOPReservingTime = 'Othr',
    pOPResizable = 'prsz',
    pOPResource = 'Oprs',
    pOPResourceColumns = 'OPRC',
    pOPResourceCost = 'OPrc',
    pOPResourceStyle = 'OPrS',
    pOPResourceType = 'Orty',
    pOPSchedule = 'OPsc',
    pOPSchedulingGranularity = 'Opsg',
    pOPSelectedResources = 'OPSR',
    pOPSelectedTasks = 'OPST',
    pOPShortDescription = 'OPde',
    pOPShowAllRows = 'OPar',
    pOPSize = 'ptsz',
    pOPSpecificDate = 'OPdd',
    pOPStandardTaskStyle = 'OPtS',
    pOPStartTime = 'OPps',
    pOPStartingBaselineDate = 'Otsp',
    pOPStartingBaselineVariance = 'Otsv',
    pOPStartingConstraintDate = 'Otsc',
    pOPStartingDate = 'Opsd',
    pOPStartingDateLocked = 'Otsl',
    pOPStartingPage = 'lwfp',
    pOPStaticCost = 'OPSC',
    pOPStyle = 'OSst',
    pOPSymbol = 'OPcs',
    pOPTargetPrinter = 'trpr',
    pOPTask = 'Optk',
    pOPTaskColumns = 'OPTC',
    pOPTaskStatus = 'OPTs',
    pOPTaskType = 'OPTT',
    pOPTemplate = 'OPTE',
    pOPTitle = 'OPti',
    pOPTotalCost = 'OPtc',
    pOPTotalSeconds = 'OPth',
    pOPTotalUses = 'OPtu',
    pOPUndetermined = 'Opps',
    pOPUnits = 'Oaan',
    pOPValue = 'OPvl',
    pOPVersion_ = 'vers',
    pOPViewsToInclude = 'OPev',
    pOPViolationCount = 'Opec',
    pOPViolationType = 'OPty',
    pOPVisible = 'pvis',
    pOPWorkTimes = 'OPpt',
    pOPZoomable = 'iszm',
    pOPZoomed = 'pzum',
};


/* Events */

enum {
    ecOPGetURL = 'GURL',
    eiOPGetURL = 'GURL',
};

enum {
    ecOPActivate = 'misc',
    eiOPActivate = 'actv',
};

enum {
    ecOPAdd = 'OFss',
    eiOPAdd = 'iadd',
    epOPTo = 'to  ',
};

enum {
    ecOPAddWorkTime = 'OPLN',
    eiOPAddWorkTime = 'ADDS',
    epOPFrom = 'OPfm',
    epOPOn = 'OPon',
//  epOPTo = 'insh',
    epOPWeekday = 'OPwd',
};

enum {
    ecOPAssign = 'OPLN',
    eiOPAssign = 'ASSN',
//  epOPTo = 'insh',
    epOPUnits = 'Oaan',
};

enum {
    ecOPBaseline = 'OPLN',
    eiOPBaseline = 'BASE',
};

enum {
    ecOPClose = 'core',
    eiOPClose = 'clos',
    epOPSaving = 'savo',
    epOPSavingIn = 'kfil',
};

enum {
    ecOPCount = 'core',
    eiOPCount = 'cnte',
    epOPEach = 'kocl',
};

enum {
    ecOPDelete = 'core',
    eiOPDelete = 'delo',
};

enum {
    ecOPDepend = 'OPLN',
    eiOPDepend = 'SCHD',
    epOPUpon = 'OPup',
};

enum {
    ecOPDuplicate = 'core',
    eiOPDuplicate = 'clon',
//  epOPTo = 'insh',
    epOPWithProperties = 'prdt',
};

enum {
    ecOPExists = 'core',
    eiOPExists = 'doex',
};

enum {
    ecOPExport = 'OPLN',
    eiOPExport = 'xprt',
    epOPAs = 'fltp',
//  epOPTo = 'kfil',
    epOPUsingTemplate = 'OPet',
//  epOPWithProperties = 'opes',
};

enum {
    ecOPFix = 'OPLN',
    eiOPFix = 'FIX ',
    epOPWithAction = 'OPAc',
};

enum {
    ecOPGet = 'core',
    eiOPGet = 'getd',
};

enum {
    ecOPLaunch = 'ascr',
    eiOPLaunch = 'noop',
};

enum {
    ecOPLevel = 'OPLN',
    eiOPLevel = 'LEVL',
};

enum {
    ecOPLookup = 'OPLN',
    eiOPLookup = 'LOOK',
    epOPIn = 'kfil',
    epOPValue = 'OPvl',
};

enum {
    ecOPMake = 'core',
    eiOPMake = 'crel',
    epOPAt = 'insh',
    epOPNew_ = 'kocl',
    epOPWithData = 'data',
//  epOPWithProperties = 'prdt',
};

enum {
    ecOPMove = 'core',
    eiOPMove = 'move',
//  epOPTo = 'insh',
};

enum {
    ecOPOpen = 'aevt',
    eiOPOpen = 'odoc',
};

enum {
    ecOPOpenLocation = 'GURL',
    eiOPOpenLocation = 'GURL',
    epOPWindow = 'WIND',
};

enum {
    ecOPOpen_ = 'OPLN',
    eiOPOpen_ = 'Fopn',
};

enum {
    ecOPPrint = 'aevt',
    eiOPPrint = 'pdoc',
    epOPPrintDialog = 'pdlg',
//  epOPWithProperties = 'prdt',
};

enum {
    ecOPQuit = 'aevt',
    eiOPQuit = 'quit',
//  epOPSaving = 'savo',
};

enum {
    ecOPRedo = 'OPLN',
    eiOPRedo = 'REDO',
};

enum {
    ecOPRemove = 'OFss',
    eiOPRemove = 'remv',
//  epOPFrom = 'from',
};

enum {
    ecOPReopen = 'aevt',
    eiOPReopen = 'rapp',
};

enum {
    ecOPRun = 'aevt',
    eiOPRun = 'oapp',
};

enum {
    ecOPSave = 'OPLN',
    eiOPSave = 'save',
//  epOPIn = 'kfil',
};

enum {
    ecOPSet = 'core',
    eiOPSet = 'setd',
//  epOPTo = 'data',
};

enum {
    ecOPSubtractWorkTime = 'OPLN',
    eiOPSubtractWorkTime = 'SUBS',
//  epOPFrom = 'OPfm',
//  epOPOn = 'OPon',
//  epOPTo = 'insh',
//  epOPWeekday = 'OPwd',
};

enum {
    ecOPUndo = 'OPLN',
    eiOPUndo = 'UNDO',
};

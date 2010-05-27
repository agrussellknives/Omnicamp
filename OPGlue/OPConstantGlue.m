/*
 * OPConstantGlue.m
 * /Applications/OmniPlan.app
 * osaglue 0.5.2
 *
 */

#import "OPConstantGlue.h"

@implementation OPConstant
+ (id)constantWithCode:(OSType)code_ {
    switch (code_) {
        case 'apr ': return [self April];
        case 'aug ': return [self August];
        case 'dec ': return [self December];
        case 'EPS ': return [self EPSPicture];
        case 'feb ': return [self February];
        case 'fri ': return [self Friday];
        case 'GIFf': return [self GIFPicture];
        case 'JPEG': return [self JPEGPicture];
        case 'jan ': return [self January];
        case 'jul ': return [self July];
        case 'jun ': return [self June];
        case 'mar ': return [self March];
        case 'may ': return [self May];
        case 'mon ': return [self Monday];
        case 'nov ': return [self November];
        case 'oct ': return [self October];
        case 'PICT': return [self PICTPicture];
        case 'tr16': return [self RGB16Color];
        case 'tr96': return [self RGB96Color];
        case 'sat ': return [self Saturday];
        case 'sep ': return [self September];
        case 'sun ': return [self Sunday];
        case 'TIFF': return [self TIFFPicture];
        case 'thu ': return [self Thursday];
        case 'tue ': return [self Tuesday];
        case 'wed ': return [self Wednesday];
        case 'OPac': return [self actions];
        case 'OPc2': return [self activityOnArrowPERT];
        case 'OPc1': return [self activityOnNodePERT];
        case 'Orai': return [self addressId];
        case 'alis': return [self alias];
        case '****': return [self anything];
        case 'capp': return [self application];
        case 'bund': return [self applicationBundleID];
        case 'rmte': return [self applicationResponses];
        case 'sign': return [self applicationSignature];
        case 'aprl': return [self applicationURL];
        case 'ask ': return [self ask];
        case 'Opas': return [self assignment];
        case 'atts': return [self attachment];
        case 'OSsa': return [self attribute];
        case 'catr': return [self attributeRun];
        case 'OPAT': return [self availableTemplates];
        case 'OPbs': return [self baseStyle];
        case 'best': return [self best];
        case 'bool': return [self boolean];
        case 'OPv0': return [self bothViews];
        case 'qdrt': return [self boundingRectangle];
        case 'pbnd': return [self bounds];
        case 'OPCC': return [self calendarColumns];
        case 'OPse': return [self calendarDaySchedule];
        case 'Odcr': return [self canRedo];
        case 'Odcu': return [self canUndo];
        case 'case': return [self case_];
        case 'cmtr': return [self centimeters];
        case 'cha ': return [self character];
        case 'Opcr': return [self childResource];
        case 'Opct': return [self childTask];
        case 'gcli': return [self classInfo];
        case 'pcls': return [self class_];
        case 'OPTc': return [self closeToDueDate];
        case 'hclb': return [self closeable];
        case 'OPcc': return [self code];
        case 'lwcl': return [self collating];
        case 'colr': return [self color];
        case 'cRGB': return [self color];
        case 'clrt': return [self colorTable];
        case 'OPco': return [self completed];
        case 'Otce': return [self completedEffort];
        case 'OPcS': return [self completedTaskStyle];
        case 'ctnr': return [self container];
        case 'lwcp': return [self copies];
        case 'OPCh': return [self costPerHour];
        case 'OPCu': return [self costPerUse];
        case 'OPcp': return [self critical];
        case 'ccmt': return [self cubicCentimeters];
        case 'cfet': return [self cubicFeet];
        case 'cuin': return [self cubicInches];
        case 'cmet': return [self cubicMeters];
        case 'cyrd': return [self cubicYards];
        case 'OPcu': return [self currency];
        case 'Opcd': return [self customData];
        case 'OPCP': return [self customDataEntry];
        case 'OPS2': return [self dailyScheduling];
        case 'tdas': return [self dashStyle];
        case 'rdat': return [self data];
        case 'ldt ': return [self date];
        case 'decm': return [self decimalStruct];
        case 'OPDT': return [self defaultTemplate];
        case 'OSdv': return [self defaultValue];
        case 'OSds': return [self definingStyle];
        case 'degc': return [self degreesCelsius];
        case 'degf': return [self degreesFahrenheit];
        case 'degk': return [self degreesKelvin];
        case 'Opdp': return [self dependency];
        case 'OPdk': return [self dependencyType];
        case 'Opds': return [self dependent];
        case 'Opdd': return [self dependentTask];
        case 'lwdt': return [self detailed];
        case 'diac': return [self diacriticals];
        case 'OPCt': return [self diagramType];
        case 'docu': return [self document];
        case 'comp': return [self doubleInteger];
        case 'OPTd': return [self dueNow];
        case 'Otdu': return [self duration];
        case 'OPef': return [self efficiency];
        case 'Otef': return [self effort];
        case 'elin': return [self elementInfo];
        case 'Orem': return [self emailAddress];
        case 'encs': return [self encodedString];
        case 'OPpe': return [self endTime];
        case 'Otep': return [self endingBaselineDate];
        case 'Otev': return [self endingBaselineVariance];
        case 'Otec': return [self endingConstraintDate];
        case 'Oped': return [self endingDate];
        case 'Otel': return [self endingDateLocked];
        case 'lwlp': return [self endingPage];
        case 'enum': return [self enumerator];
        case 'OPRe': return [self equipment];
        case 'lweh': return [self errorHandling];
        case 'evin': return [self eventInfo];
        case 'OPS0': return [self exactScheduling];
        case 'Opex': return [self expanded];
        case 'expa': return [self expansion];
        case 'OPEc': return [self exportSettings];
        case 'exte': return [self extendedFloat];
        case 'faxn': return [self faxNumber];
        case 'feet': return [self feet];
        case 'file': return [self file];
        case 'cct0': return [self fileOrListOfFile];
        case 'cct2': return [self fileOrText];
        case 'fsrf': return [self fileRef];
        case 'fss ': return [self fileSpecification];
        case 'furl': return [self fileURL];
        case 'Opfo': return [self filtered];
        case 'OPTm': return [self finished];
        case 'ODff': return [self finishfinish];
        case 'ODfs': return [self finishstart];
        case 'fixd': return [self fixed];
        case 'fpnt': return [self fixedPoint];
        case 'frct': return [self fixedRectangle];
        case 'ldbl': return [self float128bit];
        case 'doub': return [self float_];
        case 'font': return [self font];
        case 'pisf': return [self frontmost];
        case 'galn': return [self gallons];
        case 'Opgb': return [self ganttBackgroundColor];
        case 'Opgc': return [self ganttCriticalPathColor];
        case 'Opgs': return [self ganttDateScaleSeparatorColor];
        case 'Opgo': return [self ganttOffDayColor];
        case 'OPv1': return [self ganttOnly];
        case 'Opgr': return [self ganttResourceDependencyLineColor];
        case 'Opgd': return [self ganttTaskDependencyLineColor];
        case 'Opgt': return [self ganttTodayColor];
        case 'gram': return [self grams];
        case 'cgtx': return [self graphicText];
        case 'Orpa': return [self group];
        case 'OPTG': return [self groupTask];
        case 'OPtS': return [self groupTaskStyle];
        case 'OPOV': return [self hasOverview];
        case 'OPS1': return [self hourlyScheduling];
        case 'OPht': return [self html];
        case 'hyph': return [self hyphens];
        case 'OPit': return [self iCalTodo];
        case 'ID  ': return [self id_];
        case 'inch': return [self inches];
        case 'OPig': return [self includeTaskGroups];
        case 'pidx': return [self index];
        case 'long': return [self integer];
        case 'itxt': return [self internationalText];
        case 'intl': return [self internationalWritingCode];
        case 'cobj': return [self item];
        case 'kpid': return [self kernelProcessID];
        case 'kgrm': return [self kilograms];
        case 'kmtr': return [self kilometers];
        case 'OPlp': return [self leadPercentage];
        case 'OPlt': return [self leadTime];
        case 'list': return [self list];
        case 'cct1': return [self listOfFileOrSpecifier];
        case 'cct4': return [self listOfSpecifierOrSpecifier];
        case 'litr': return [self liters];
        case 'insl': return [self locationReference];
        case 'lfxd': return [self longFixed];
        case 'lfpt': return [self longFixedPoint];
        case 'lfrc': return [self longFixedRectangle];
        case 'lpnt': return [self longPoint];
        case 'lrct': return [self longRectangle];
        case 'port': return [self machPort];
        case 'mach': return [self machine];
        case 'mLoc': return [self machineLocation];
        case 'OPRm': return [self material];
        case 'metr': return [self meters];
        case 'mile': return [self miles];
        case 'Opms': return [self milestone];
        case 'OPTM': return [self milestoneTask];
        case 'OPmS': return [self milestoneTaskStyle];
        case 'ismn': return [self minimizable];
        case 'pmnd': return [self minimized];
        case 'msng': return [self missingValue];
        case 'imod': return [self modified];
        case 'pnam': return [self name];
        case 'OSns': return [self namedStyle];
        case 'no  ': return [self no];
        case 'Opnt': return [self note];
        case 'Opne': return [self noteExpanded];
        case 'OPnS': return [self noteStyle];
        case 'null': return [self null];
        case 'Orna': return [self number];
        case 'nume': return [self numericStrings];
        case 'OPTo': return [self ok];
        case 'ozs ': return [self ounces];
        case 'Odep': return [self outlineDepth];
        case 'Onum': return [self outlineNumber];
        case 'OPv2': return [self outlineOnly];
        case 'lwla': return [self pagesAcross];
        case 'lwld': return [self pagesDown];
        case 'cpar': return [self paragraph];
        case 'pmin': return [self parameterInfo];
        case 'Otgr': return [self parentTask];
        case 'OPTp': return [self pastDue];
        case 'OPRs': return [self person];
        case 'tpmm': return [self pixelMapRecord];
        case 'QDpt': return [self point];
        case 'lbs ': return [self pounds];
        case 'Oprq': return [self prerequisite];
        case 'Oppp': return [self prerequisiteTask];
        case 'pset': return [self printSettings];
        case 'Otpr': return [self priority];
        case 'psn ': return [self processSerialNumber];
        case 'OPpj': return [self project];
        case 'pALL': return [self properties];
        case 'prop': return [self property];
        case 'pinf': return [self propertyInfo];
        case 'punc': return [self punctuation];
        case 'qrts': return [self quarts];
        case 'cct5': return [self realOrTextOrColorOrIntegerOrListOfReal];
        case 'OPfe': return [self recalculatesDuration];
        case 'OPre': return [self recalculatesEffort];
        case 'reco': return [self record];
        case 'obj ': return [self reference];
        case 'Oter': return [self remainingEffort];
        case 'Otrt': return [self reserveTime];
        case 'Othr': return [self reservingTime];
        case 'prsz': return [self resizable];
        case 'Oprs': return [self resource];
        case 'OPRC': return [self resourceColumns];
        case 'OPrc': return [self resourceCost];
        case 'OPRg': return [self resourceGroup];
        case 'OPrS': return [self resourceStyle];
        case 'Orty': return [self resourceType];
        case 'ctxt': return [self richText];
        case 'trot': return [self rotation];
        case 'OPsc': return [self schedule];
        case 'Opsg': return [self schedulingGranularity];
        case 'scpt': return [self script];
        case 'OPSR': return [self selectedResources];
        case 'OPST': return [self selectedTasks];
        case 'OPde': return [self shortDescription];
        case 'sing': return [self shortFloat];
        case 'shor': return [self shortInteger];
        case 'OPar': return [self showAllRows];
        case 'ptsz': return [self size];
        case 'OPdd': return [self specificDate];
        case 'sqft': return [self squareFeet];
        case 'sqkm': return [self squareKilometers];
        case 'sqrm': return [self squareMeters];
        case 'sqmi': return [self squareMiles];
        case 'sqyd': return [self squareYards];
        case 'lwst': return [self standard];
        case 'OPTS': return [self standardTask];
        case 'OPps': return [self startTime];
        case 'ODsf': return [self startfinish];
        case 'Otsp': return [self startingBaselineDate];
        case 'Otsv': return [self startingBaselineVariance];
        case 'Otsc': return [self startingConstraintDate];
        case 'Opsd': return [self startingDate];
        case 'Otsl': return [self startingDateLocked];
        case 'lwfp': return [self startingPage];
        case 'ODss': return [self startstart];
        case 'OPSC': return [self staticCost];
        case 'TEXT': return [self string];
        case 'OSst': return [self style];
        case 'styl': return [self styledClipboardText];
        case 'STXT': return [self styledText];
        case 'suin': return [self suiteInfo];
        case 'OPcs': return [self symbol];
        case 'trpr': return [self targetPrinter];
        case 'Optk': return [self task];
        case 'OPTC': return [self taskColumns];
        case 'OPTs': return [self taskStatus];
        case 'OPTT': return [self taskType];
        case 'OPTE': return [self template];
        case 'tsty': return [self textStyleInfo];
        case 'OPti': return [self title];
        case 'OPtc': return [self totalCost];
        case 'OPth': return [self totalSeconds];
        case 'OPtu': return [self totalUses];
        case 'type': return [self typeClass];
        case 'Opps': return [self undetermined];
        case 'utxt': return [self unicodeText];
        case 'Oaan': return [self units];
        case 'magn': return [self unsignedInteger];
        case 'ut16': return [self utf16Text];
        case 'utf8': return [self utf8Text];
        case 'OPvl': return [self value];
        case 'vers': return [self version_];
        case 'OPev': return [self viewsToInclude];
        case 'Opis': return [self violation];
        case 'Opec': return [self violationCount];
        case 'OPty': return [self violationType];
        case 'pvis': return [self visible];
        case 'OPsd': return [self weekDaySchedule];
        case 'cct3': return [self weekDayScheduleOrCalendarDaySchedule];
        case 'whit': return [self whitespace];
        case 'cwin': return [self window];
        case 'cwor': return [self word];
        case 'OPc0': return [self workBreakdownStructure];
        case 'OPpt': return [self workTimes];
        case 'psct': return [self writingCode];
        case 'yard': return [self yards];
        case 'yes ': return [self yes];
        case 'iszm': return [self zoomable];
        case 'pzum': return [self zoomed];
        default: return [[self superclass] constantWithCode: code_];
    }
}


/* Enumerators */

+ (OPConstant *)activityOnArrowPERT {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"activityOnArrowPERT" type: typeEnumerated code: 'OPc2'];
    return constantObj;
}

+ (OPConstant *)activityOnNodePERT {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"activityOnNodePERT" type: typeEnumerated code: 'OPc1'];
    return constantObj;
}

+ (OPConstant *)applicationResponses {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"applicationResponses" type: typeEnumerated code: 'rmte'];
    return constantObj;
}

+ (OPConstant *)ask {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"ask" type: typeEnumerated code: 'ask '];
    return constantObj;
}

+ (OPConstant *)bothViews {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"bothViews" type: typeEnumerated code: 'OPv0'];
    return constantObj;
}

+ (OPConstant *)case_ {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"case_" type: typeEnumerated code: 'case'];
    return constantObj;
}

+ (OPConstant *)closeToDueDate {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"closeToDueDate" type: typeEnumerated code: 'OPTc'];
    return constantObj;
}

+ (OPConstant *)dailyScheduling {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"dailyScheduling" type: typeEnumerated code: 'OPS2'];
    return constantObj;
}

+ (OPConstant *)detailed {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"detailed" type: typeEnumerated code: 'lwdt'];
    return constantObj;
}

+ (OPConstant *)diacriticals {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"diacriticals" type: typeEnumerated code: 'diac'];
    return constantObj;
}

+ (OPConstant *)dueNow {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"dueNow" type: typeEnumerated code: 'OPTd'];
    return constantObj;
}

+ (OPConstant *)equipment {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"equipment" type: typeEnumerated code: 'OPRe'];
    return constantObj;
}

+ (OPConstant *)exactScheduling {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"exactScheduling" type: typeEnumerated code: 'OPS0'];
    return constantObj;
}

+ (OPConstant *)expansion {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"expansion" type: typeEnumerated code: 'expa'];
    return constantObj;
}

+ (OPConstant *)finished {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"finished" type: typeEnumerated code: 'OPTm'];
    return constantObj;
}

+ (OPConstant *)finishfinish {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"finishfinish" type: typeEnumerated code: 'ODff'];
    return constantObj;
}

+ (OPConstant *)finishstart {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"finishstart" type: typeEnumerated code: 'ODfs'];
    return constantObj;
}

+ (OPConstant *)ganttOnly {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"ganttOnly" type: typeEnumerated code: 'OPv1'];
    return constantObj;
}

+ (OPConstant *)groupTask {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"groupTask" type: typeEnumerated code: 'OPTG'];
    return constantObj;
}

+ (OPConstant *)hourlyScheduling {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"hourlyScheduling" type: typeEnumerated code: 'OPS1'];
    return constantObj;
}

+ (OPConstant *)hyphens {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"hyphens" type: typeEnumerated code: 'hyph'];
    return constantObj;
}

+ (OPConstant *)material {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"material" type: typeEnumerated code: 'OPRm'];
    return constantObj;
}

+ (OPConstant *)milestoneTask {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"milestoneTask" type: typeEnumerated code: 'OPTM'];
    return constantObj;
}

+ (OPConstant *)no {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"no" type: typeEnumerated code: 'no  '];
    return constantObj;
}

+ (OPConstant *)numericStrings {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"numericStrings" type: typeEnumerated code: 'nume'];
    return constantObj;
}

+ (OPConstant *)ok {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"ok" type: typeEnumerated code: 'OPTo'];
    return constantObj;
}

+ (OPConstant *)outlineOnly {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"outlineOnly" type: typeEnumerated code: 'OPv2'];
    return constantObj;
}

+ (OPConstant *)pastDue {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"pastDue" type: typeEnumerated code: 'OPTp'];
    return constantObj;
}

+ (OPConstant *)person {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"person" type: typeEnumerated code: 'OPRs'];
    return constantObj;
}

+ (OPConstant *)punctuation {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"punctuation" type: typeEnumerated code: 'punc'];
    return constantObj;
}

+ (OPConstant *)resourceGroup {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"resourceGroup" type: typeEnumerated code: 'OPRg'];
    return constantObj;
}

+ (OPConstant *)standard {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"standard" type: typeEnumerated code: 'lwst'];
    return constantObj;
}

+ (OPConstant *)standardTask {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"standardTask" type: typeEnumerated code: 'OPTS'];
    return constantObj;
}

+ (OPConstant *)startfinish {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"startfinish" type: typeEnumerated code: 'ODsf'];
    return constantObj;
}

+ (OPConstant *)startstart {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"startstart" type: typeEnumerated code: 'ODss'];
    return constantObj;
}

+ (OPConstant *)whitespace {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"whitespace" type: typeEnumerated code: 'whit'];
    return constantObj;
}

+ (OPConstant *)workBreakdownStructure {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"workBreakdownStructure" type: typeEnumerated code: 'OPc0'];
    return constantObj;
}

+ (OPConstant *)yes {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"yes" type: typeEnumerated code: 'yes '];
    return constantObj;
}


/* Types and properties */

+ (OPConstant *)April {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"April" type: typeType code: 'apr '];
    return constantObj;
}

+ (OPConstant *)August {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"August" type: typeType code: 'aug '];
    return constantObj;
}

+ (OPConstant *)December {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"December" type: typeType code: 'dec '];
    return constantObj;
}

+ (OPConstant *)EPSPicture {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"EPSPicture" type: typeType code: 'EPS '];
    return constantObj;
}

+ (OPConstant *)February {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"February" type: typeType code: 'feb '];
    return constantObj;
}

+ (OPConstant *)Friday {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"Friday" type: typeType code: 'fri '];
    return constantObj;
}

+ (OPConstant *)GIFPicture {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"GIFPicture" type: typeType code: 'GIFf'];
    return constantObj;
}

+ (OPConstant *)JPEGPicture {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"JPEGPicture" type: typeType code: 'JPEG'];
    return constantObj;
}

+ (OPConstant *)January {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"January" type: typeType code: 'jan '];
    return constantObj;
}

+ (OPConstant *)July {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"July" type: typeType code: 'jul '];
    return constantObj;
}

+ (OPConstant *)June {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"June" type: typeType code: 'jun '];
    return constantObj;
}

+ (OPConstant *)March {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"March" type: typeType code: 'mar '];
    return constantObj;
}

+ (OPConstant *)May {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"May" type: typeType code: 'may '];
    return constantObj;
}

+ (OPConstant *)Monday {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"Monday" type: typeType code: 'mon '];
    return constantObj;
}

+ (OPConstant *)November {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"November" type: typeType code: 'nov '];
    return constantObj;
}

+ (OPConstant *)October {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"October" type: typeType code: 'oct '];
    return constantObj;
}

+ (OPConstant *)PICTPicture {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"PICTPicture" type: typeType code: 'PICT'];
    return constantObj;
}

+ (OPConstant *)RGB16Color {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"RGB16Color" type: typeType code: 'tr16'];
    return constantObj;
}

+ (OPConstant *)RGB96Color {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"RGB96Color" type: typeType code: 'tr96'];
    return constantObj;
}

+ (OPConstant *)RGBColor {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"RGBColor" type: typeType code: 'cRGB'];
    return constantObj;
}

+ (OPConstant *)Saturday {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"Saturday" type: typeType code: 'sat '];
    return constantObj;
}

+ (OPConstant *)September {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"September" type: typeType code: 'sep '];
    return constantObj;
}

+ (OPConstant *)Sunday {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"Sunday" type: typeType code: 'sun '];
    return constantObj;
}

+ (OPConstant *)TIFFPicture {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"TIFFPicture" type: typeType code: 'TIFF'];
    return constantObj;
}

+ (OPConstant *)Thursday {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"Thursday" type: typeType code: 'thu '];
    return constantObj;
}

+ (OPConstant *)Tuesday {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"Tuesday" type: typeType code: 'tue '];
    return constantObj;
}

+ (OPConstant *)Wednesday {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"Wednesday" type: typeType code: 'wed '];
    return constantObj;
}

+ (OPConstant *)actions {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"actions" type: typeType code: 'OPac'];
    return constantObj;
}

+ (OPConstant *)addressId {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"addressId" type: typeType code: 'Orai'];
    return constantObj;
}

+ (OPConstant *)alias {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"alias" type: typeType code: 'alis'];
    return constantObj;
}

+ (OPConstant *)anything {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"anything" type: typeType code: '****'];
    return constantObj;
}

+ (OPConstant *)application {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"application" type: typeType code: 'capp'];
    return constantObj;
}

+ (OPConstant *)applicationBundleID {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"applicationBundleID" type: typeType code: 'bund'];
    return constantObj;
}

+ (OPConstant *)applicationSignature {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"applicationSignature" type: typeType code: 'sign'];
    return constantObj;
}

+ (OPConstant *)applicationURL {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"applicationURL" type: typeType code: 'aprl'];
    return constantObj;
}

+ (OPConstant *)assignment {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"assignment" type: typeType code: 'Opas'];
    return constantObj;
}

+ (OPConstant *)attachment {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"attachment" type: typeType code: 'atts'];
    return constantObj;
}

+ (OPConstant *)attribute {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"attribute" type: typeType code: 'OSsa'];
    return constantObj;
}

+ (OPConstant *)attributeRun {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"attributeRun" type: typeType code: 'catr'];
    return constantObj;
}

+ (OPConstant *)availableTemplates {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"availableTemplates" type: typeType code: 'OPAT'];
    return constantObj;
}

+ (OPConstant *)baseStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"baseStyle" type: typeType code: 'OPbs'];
    return constantObj;
}

+ (OPConstant *)best {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"best" type: typeType code: 'best'];
    return constantObj;
}

+ (OPConstant *)boolean {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"boolean" type: typeType code: 'bool'];
    return constantObj;
}

+ (OPConstant *)boundingRectangle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"boundingRectangle" type: typeType code: 'qdrt'];
    return constantObj;
}

+ (OPConstant *)bounds {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"bounds" type: typeType code: 'pbnd'];
    return constantObj;
}

+ (OPConstant *)calendarColumns {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"calendarColumns" type: typeType code: 'OPCC'];
    return constantObj;
}

+ (OPConstant *)calendarDaySchedule {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"calendarDaySchedule" type: typeType code: 'OPse'];
    return constantObj;
}

+ (OPConstant *)canRedo {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"canRedo" type: typeType code: 'Odcr'];
    return constantObj;
}

+ (OPConstant *)canUndo {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"canUndo" type: typeType code: 'Odcu'];
    return constantObj;
}

+ (OPConstant *)centimeters {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"centimeters" type: typeType code: 'cmtr'];
    return constantObj;
}

+ (OPConstant *)character {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"character" type: typeType code: 'cha '];
    return constantObj;
}

+ (OPConstant *)childResource {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"childResource" type: typeType code: 'Opcr'];
    return constantObj;
}

+ (OPConstant *)childTask {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"childTask" type: typeType code: 'Opct'];
    return constantObj;
}

+ (OPConstant *)classInfo {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"classInfo" type: typeType code: 'gcli'];
    return constantObj;
}

+ (OPConstant *)class_ {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"class_" type: typeType code: 'pcls'];
    return constantObj;
}

+ (OPConstant *)closeable {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"closeable" type: typeType code: 'hclb'];
    return constantObj;
}

+ (OPConstant *)code {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"code" type: typeType code: 'OPcc'];
    return constantObj;
}

+ (OPConstant *)collating {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"collating" type: typeType code: 'lwcl'];
    return constantObj;
}

+ (OPConstant *)color {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"color" type: typeType code: 'cRGB'];
    return constantObj;
}

+ (OPConstant *)colorTable {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"colorTable" type: typeType code: 'clrt'];
    return constantObj;
}

+ (OPConstant *)columnTitleStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"columnTitleStyle" type: typeType code: 'OPtS'];
    return constantObj;
}

+ (OPConstant *)completed {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"completed" type: typeType code: 'OPco'];
    return constantObj;
}

+ (OPConstant *)completedEffort {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"completedEffort" type: typeType code: 'Otce'];
    return constantObj;
}

+ (OPConstant *)completedTaskStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"completedTaskStyle" type: typeType code: 'OPcS'];
    return constantObj;
}

+ (OPConstant *)container {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"container" type: typeType code: 'ctnr'];
    return constantObj;
}

+ (OPConstant *)copies {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"copies" type: typeType code: 'lwcp'];
    return constantObj;
}

+ (OPConstant *)costPerHour {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"costPerHour" type: typeType code: 'OPCh'];
    return constantObj;
}

+ (OPConstant *)costPerUse {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"costPerUse" type: typeType code: 'OPCu'];
    return constantObj;
}

+ (OPConstant *)critical {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"critical" type: typeType code: 'OPcp'];
    return constantObj;
}

+ (OPConstant *)cubicCentimeters {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"cubicCentimeters" type: typeType code: 'ccmt'];
    return constantObj;
}

+ (OPConstant *)cubicFeet {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"cubicFeet" type: typeType code: 'cfet'];
    return constantObj;
}

+ (OPConstant *)cubicInches {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"cubicInches" type: typeType code: 'cuin'];
    return constantObj;
}

+ (OPConstant *)cubicMeters {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"cubicMeters" type: typeType code: 'cmet'];
    return constantObj;
}

+ (OPConstant *)cubicYards {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"cubicYards" type: typeType code: 'cyrd'];
    return constantObj;
}

+ (OPConstant *)currency {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"currency" type: typeType code: 'OPcu'];
    return constantObj;
}

+ (OPConstant *)customData {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"customData" type: typeType code: 'Opcd'];
    return constantObj;
}

+ (OPConstant *)customDataEntry {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"customDataEntry" type: typeType code: 'OPCP'];
    return constantObj;
}

+ (OPConstant *)dashStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"dashStyle" type: typeType code: 'tdas'];
    return constantObj;
}

+ (OPConstant *)data {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"data" type: typeType code: 'rdat'];
    return constantObj;
}

+ (OPConstant *)date {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"date" type: typeType code: 'ldt '];
    return constantObj;
}

+ (OPConstant *)decimalStruct {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"decimalStruct" type: typeType code: 'decm'];
    return constantObj;
}

+ (OPConstant *)defaultTemplate {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"defaultTemplate" type: typeType code: 'OPDT'];
    return constantObj;
}

+ (OPConstant *)defaultValue {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"defaultValue" type: typeType code: 'OSdv'];
    return constantObj;
}

+ (OPConstant *)definingStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"definingStyle" type: typeType code: 'OSds'];
    return constantObj;
}

+ (OPConstant *)degreesCelsius {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"degreesCelsius" type: typeType code: 'degc'];
    return constantObj;
}

+ (OPConstant *)degreesFahrenheit {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"degreesFahrenheit" type: typeType code: 'degf'];
    return constantObj;
}

+ (OPConstant *)degreesKelvin {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"degreesKelvin" type: typeType code: 'degk'];
    return constantObj;
}

+ (OPConstant *)dependency {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"dependency" type: typeType code: 'Opdp'];
    return constantObj;
}

+ (OPConstant *)dependencyType {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"dependencyType" type: typeType code: 'OPdk'];
    return constantObj;
}

+ (OPConstant *)dependent {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"dependent" type: typeType code: 'Opds'];
    return constantObj;
}

+ (OPConstant *)dependentTask {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"dependentTask" type: typeType code: 'Opdd'];
    return constantObj;
}

+ (OPConstant *)diagramType {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"diagramType" type: typeType code: 'OPCt'];
    return constantObj;
}

+ (OPConstant *)document {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"document" type: typeType code: 'docu'];
    return constantObj;
}

+ (OPConstant *)doubleInteger {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"doubleInteger" type: typeType code: 'comp'];
    return constantObj;
}

+ (OPConstant *)duration {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"duration" type: typeType code: 'Otdu'];
    return constantObj;
}

+ (OPConstant *)efficiency {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"efficiency" type: typeType code: 'OPef'];
    return constantObj;
}

+ (OPConstant *)effort {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"effort" type: typeType code: 'Otef'];
    return constantObj;
}

+ (OPConstant *)elementInfo {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"elementInfo" type: typeType code: 'elin'];
    return constantObj;
}

+ (OPConstant *)emailAddress {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"emailAddress" type: typeType code: 'Orem'];
    return constantObj;
}

+ (OPConstant *)encodedString {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"encodedString" type: typeType code: 'encs'];
    return constantObj;
}

+ (OPConstant *)endTime {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"endTime" type: typeType code: 'OPpe'];
    return constantObj;
}

+ (OPConstant *)endingBaselineDate {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"endingBaselineDate" type: typeType code: 'Otep'];
    return constantObj;
}

+ (OPConstant *)endingBaselineVariance {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"endingBaselineVariance" type: typeType code: 'Otev'];
    return constantObj;
}

+ (OPConstant *)endingConstraintDate {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"endingConstraintDate" type: typeType code: 'Otec'];
    return constantObj;
}

+ (OPConstant *)endingDate {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"endingDate" type: typeType code: 'Oped'];
    return constantObj;
}

+ (OPConstant *)endingDateLocked {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"endingDateLocked" type: typeType code: 'Otel'];
    return constantObj;
}

+ (OPConstant *)endingPage {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"endingPage" type: typeType code: 'lwlp'];
    return constantObj;
}

+ (OPConstant *)enumerator {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"enumerator" type: typeType code: 'enum'];
    return constantObj;
}

+ (OPConstant *)errorHandling {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"errorHandling" type: typeType code: 'lweh'];
    return constantObj;
}

+ (OPConstant *)eventInfo {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"eventInfo" type: typeType code: 'evin'];
    return constantObj;
}

+ (OPConstant *)expanded {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"expanded" type: typeType code: 'Opex'];
    return constantObj;
}

+ (OPConstant *)exportSettings {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"exportSettings" type: typeType code: 'OPEc'];
    return constantObj;
}

+ (OPConstant *)extendedFloat {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"extendedFloat" type: typeType code: 'exte'];
    return constantObj;
}

+ (OPConstant *)faxNumber {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"faxNumber" type: typeType code: 'faxn'];
    return constantObj;
}

+ (OPConstant *)feet {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"feet" type: typeType code: 'feet'];
    return constantObj;
}

+ (OPConstant *)file {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"file" type: typeType code: 'file'];
    return constantObj;
}

+ (OPConstant *)fileOrListOfFile {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"fileOrListOfFile" type: typeType code: 'cct0'];
    return constantObj;
}

+ (OPConstant *)fileOrText {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"fileOrText" type: typeType code: 'cct2'];
    return constantObj;
}

+ (OPConstant *)fileRef {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"fileRef" type: typeType code: 'fsrf'];
    return constantObj;
}

+ (OPConstant *)fileSpecification {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"fileSpecification" type: typeType code: 'fss '];
    return constantObj;
}

+ (OPConstant *)fileURL {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"fileURL" type: typeType code: 'furl'];
    return constantObj;
}

+ (OPConstant *)filtered {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"filtered" type: typeType code: 'Opfo'];
    return constantObj;
}

+ (OPConstant *)fixed {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"fixed" type: typeType code: 'fixd'];
    return constantObj;
}

+ (OPConstant *)fixedPoint {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"fixedPoint" type: typeType code: 'fpnt'];
    return constantObj;
}

+ (OPConstant *)fixedRectangle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"fixedRectangle" type: typeType code: 'frct'];
    return constantObj;
}

+ (OPConstant *)float128bit {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"float128bit" type: typeType code: 'ldbl'];
    return constantObj;
}

+ (OPConstant *)float_ {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"float_" type: typeType code: 'doub'];
    return constantObj;
}

+ (OPConstant *)font {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"font" type: typeType code: 'font'];
    return constantObj;
}

+ (OPConstant *)frontmost {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"frontmost" type: typeType code: 'pisf'];
    return constantObj;
}

+ (OPConstant *)gallons {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"gallons" type: typeType code: 'galn'];
    return constantObj;
}

+ (OPConstant *)ganttBackgroundColor {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"ganttBackgroundColor" type: typeType code: 'Opgb'];
    return constantObj;
}

+ (OPConstant *)ganttCriticalPathColor {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"ganttCriticalPathColor" type: typeType code: 'Opgc'];
    return constantObj;
}

+ (OPConstant *)ganttDateScaleSeparatorColor {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"ganttDateScaleSeparatorColor" type: typeType code: 'Opgs'];
    return constantObj;
}

+ (OPConstant *)ganttOffDayColor {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"ganttOffDayColor" type: typeType code: 'Opgo'];
    return constantObj;
}

+ (OPConstant *)ganttResourceDependencyLineColor {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"ganttResourceDependencyLineColor" type: typeType code: 'Opgr'];
    return constantObj;
}

+ (OPConstant *)ganttTaskDependencyLineColor {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"ganttTaskDependencyLineColor" type: typeType code: 'Opgd'];
    return constantObj;
}

+ (OPConstant *)ganttTodayColor {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"ganttTodayColor" type: typeType code: 'Opgt'];
    return constantObj;
}

+ (OPConstant *)grams {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"grams" type: typeType code: 'gram'];
    return constantObj;
}

+ (OPConstant *)graphicText {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"graphicText" type: typeType code: 'cgtx'];
    return constantObj;
}

+ (OPConstant *)group {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"group" type: typeType code: 'Orpa'];
    return constantObj;
}

+ (OPConstant *)groupTaskStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"groupTaskStyle" type: typeType code: 'OPtS'];
    return constantObj;
}

+ (OPConstant *)hasOverview {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"hasOverview" type: typeType code: 'OPOV'];
    return constantObj;
}

+ (OPConstant *)html {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"html" type: typeType code: 'OPht'];
    return constantObj;
}

+ (OPConstant *)iCalTodo {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"iCalTodo" type: typeType code: 'OPit'];
    return constantObj;
}

+ (OPConstant *)id_ {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"id_" type: typeType code: 'ID  '];
    return constantObj;
}

+ (OPConstant *)inches {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"inches" type: typeType code: 'inch'];
    return constantObj;
}

+ (OPConstant *)includeTaskGroups {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"includeTaskGroups" type: typeType code: 'OPig'];
    return constantObj;
}

+ (OPConstant *)index {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"index" type: typeType code: 'pidx'];
    return constantObj;
}

+ (OPConstant *)integer {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"integer" type: typeType code: 'long'];
    return constantObj;
}

+ (OPConstant *)internationalText {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"internationalText" type: typeType code: 'itxt'];
    return constantObj;
}

+ (OPConstant *)internationalWritingCode {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"internationalWritingCode" type: typeType code: 'intl'];
    return constantObj;
}

+ (OPConstant *)item {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"item" type: typeType code: 'cobj'];
    return constantObj;
}

+ (OPConstant *)kernelProcessID {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"kernelProcessID" type: typeType code: 'kpid'];
    return constantObj;
}

+ (OPConstant *)kilograms {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"kilograms" type: typeType code: 'kgrm'];
    return constantObj;
}

+ (OPConstant *)kilometers {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"kilometers" type: typeType code: 'kmtr'];
    return constantObj;
}

+ (OPConstant *)leadPercentage {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"leadPercentage" type: typeType code: 'OPlp'];
    return constantObj;
}

+ (OPConstant *)leadTime {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"leadTime" type: typeType code: 'OPlt'];
    return constantObj;
}

+ (OPConstant *)list {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"list" type: typeType code: 'list'];
    return constantObj;
}

+ (OPConstant *)listOfFileOrSpecifier {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"listOfFileOrSpecifier" type: typeType code: 'cct1'];
    return constantObj;
}

+ (OPConstant *)listOfSpecifierOrSpecifier {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"listOfSpecifierOrSpecifier" type: typeType code: 'cct4'];
    return constantObj;
}

+ (OPConstant *)liters {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"liters" type: typeType code: 'litr'];
    return constantObj;
}

+ (OPConstant *)locationReference {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"locationReference" type: typeType code: 'insl'];
    return constantObj;
}

+ (OPConstant *)longFixed {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"longFixed" type: typeType code: 'lfxd'];
    return constantObj;
}

+ (OPConstant *)longFixedPoint {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"longFixedPoint" type: typeType code: 'lfpt'];
    return constantObj;
}

+ (OPConstant *)longFixedRectangle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"longFixedRectangle" type: typeType code: 'lfrc'];
    return constantObj;
}

+ (OPConstant *)longPoint {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"longPoint" type: typeType code: 'lpnt'];
    return constantObj;
}

+ (OPConstant *)longRectangle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"longRectangle" type: typeType code: 'lrct'];
    return constantObj;
}

+ (OPConstant *)machPort {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"machPort" type: typeType code: 'port'];
    return constantObj;
}

+ (OPConstant *)machine {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"machine" type: typeType code: 'mach'];
    return constantObj;
}

+ (OPConstant *)machineLocation {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"machineLocation" type: typeType code: 'mLoc'];
    return constantObj;
}

+ (OPConstant *)meters {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"meters" type: typeType code: 'metr'];
    return constantObj;
}

+ (OPConstant *)miles {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"miles" type: typeType code: 'mile'];
    return constantObj;
}

+ (OPConstant *)milestone {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"milestone" type: typeType code: 'Opms'];
    return constantObj;
}

+ (OPConstant *)milestoneTaskStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"milestoneTaskStyle" type: typeType code: 'OPmS'];
    return constantObj;
}

+ (OPConstant *)minimizable {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"minimizable" type: typeType code: 'ismn'];
    return constantObj;
}

+ (OPConstant *)minimized {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"minimized" type: typeType code: 'pmnd'];
    return constantObj;
}

+ (OPConstant *)missingValue {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"missingValue" type: typeType code: 'msng'];
    return constantObj;
}

+ (OPConstant *)modified {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"modified" type: typeType code: 'imod'];
    return constantObj;
}

+ (OPConstant *)name {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"name" type: typeType code: 'pnam'];
    return constantObj;
}

+ (OPConstant *)namedStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"namedStyle" type: typeType code: 'OSns'];
    return constantObj;
}

+ (OPConstant *)note {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"note" type: typeType code: 'Opnt'];
    return constantObj;
}

+ (OPConstant *)noteExpanded {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"noteExpanded" type: typeType code: 'Opne'];
    return constantObj;
}

+ (OPConstant *)noteStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"noteStyle" type: typeType code: 'OPnS'];
    return constantObj;
}

+ (OPConstant *)null {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"null" type: typeType code: 'null'];
    return constantObj;
}

+ (OPConstant *)number {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"number" type: typeType code: 'Orna'];
    return constantObj;
}

+ (OPConstant *)ounces {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"ounces" type: typeType code: 'ozs '];
    return constantObj;
}

+ (OPConstant *)outlineDepth {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"outlineDepth" type: typeType code: 'Odep'];
    return constantObj;
}

+ (OPConstant *)outlineNumber {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"outlineNumber" type: typeType code: 'Onum'];
    return constantObj;
}

+ (OPConstant *)overdueTaskStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"overdueTaskStyle" type: typeType code: 'OPtS'];
    return constantObj;
}

+ (OPConstant *)pagesAcross {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"pagesAcross" type: typeType code: 'lwla'];
    return constantObj;
}

+ (OPConstant *)pagesDown {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"pagesDown" type: typeType code: 'lwld'];
    return constantObj;
}

+ (OPConstant *)paragraph {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"paragraph" type: typeType code: 'cpar'];
    return constantObj;
}

+ (OPConstant *)parameterInfo {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"parameterInfo" type: typeType code: 'pmin'];
    return constantObj;
}

+ (OPConstant *)parentTask {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"parentTask" type: typeType code: 'Otgr'];
    return constantObj;
}

+ (OPConstant *)pixelMapRecord {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"pixelMapRecord" type: typeType code: 'tpmm'];
    return constantObj;
}

+ (OPConstant *)point {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"point" type: typeType code: 'QDpt'];
    return constantObj;
}

+ (OPConstant *)pounds {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"pounds" type: typeType code: 'lbs '];
    return constantObj;
}

+ (OPConstant *)prerequisite {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"prerequisite" type: typeType code: 'Oprq'];
    return constantObj;
}

+ (OPConstant *)prerequisiteTask {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"prerequisiteTask" type: typeType code: 'Oppp'];
    return constantObj;
}

+ (OPConstant *)printSettings {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"printSettings" type: typeType code: 'pset'];
    return constantObj;
}

+ (OPConstant *)priority {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"priority" type: typeType code: 'Otpr'];
    return constantObj;
}

+ (OPConstant *)processSerialNumber {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"processSerialNumber" type: typeType code: 'psn '];
    return constantObj;
}

+ (OPConstant *)project {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"project" type: typeType code: 'OPpj'];
    return constantObj;
}

+ (OPConstant *)properties {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"properties" type: typeType code: 'pALL'];
    return constantObj;
}

+ (OPConstant *)property {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"property" type: typeType code: 'prop'];
    return constantObj;
}

+ (OPConstant *)propertyInfo {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"propertyInfo" type: typeType code: 'pinf'];
    return constantObj;
}

+ (OPConstant *)quarts {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"quarts" type: typeType code: 'qrts'];
    return constantObj;
}

+ (OPConstant *)realOrTextOrColorOrIntegerOrListOfReal {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"realOrTextOrColorOrIntegerOrListOfReal" type: typeType code: 'cct5'];
    return constantObj;
}

+ (OPConstant *)recalculatesDuration {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"recalculatesDuration" type: typeType code: 'OPfe'];
    return constantObj;
}

+ (OPConstant *)recalculatesEffort {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"recalculatesEffort" type: typeType code: 'OPre'];
    return constantObj;
}

+ (OPConstant *)record {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"record" type: typeType code: 'reco'];
    return constantObj;
}

+ (OPConstant *)reference {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"reference" type: typeType code: 'obj '];
    return constantObj;
}

+ (OPConstant *)remainingEffort {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"remainingEffort" type: typeType code: 'Oter'];
    return constantObj;
}

+ (OPConstant *)reserveTime {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"reserveTime" type: typeType code: 'Otrt'];
    return constantObj;
}

+ (OPConstant *)reservingTime {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"reservingTime" type: typeType code: 'Othr'];
    return constantObj;
}

+ (OPConstant *)resizable {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"resizable" type: typeType code: 'prsz'];
    return constantObj;
}

+ (OPConstant *)resource {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"resource" type: typeType code: 'Oprs'];
    return constantObj;
}

+ (OPConstant *)resourceColumns {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"resourceColumns" type: typeType code: 'OPRC'];
    return constantObj;
}

+ (OPConstant *)resourceCost {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"resourceCost" type: typeType code: 'OPrc'];
    return constantObj;
}

+ (OPConstant *)resourceStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"resourceStyle" type: typeType code: 'OPrS'];
    return constantObj;
}

+ (OPConstant *)resourceType {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"resourceType" type: typeType code: 'Orty'];
    return constantObj;
}

+ (OPConstant *)richText {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"richText" type: typeType code: 'ctxt'];
    return constantObj;
}

+ (OPConstant *)rotation {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"rotation" type: typeType code: 'trot'];
    return constantObj;
}

+ (OPConstant *)schedule {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"schedule" type: typeType code: 'OPsc'];
    return constantObj;
}

+ (OPConstant *)schedulingGranularity {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"schedulingGranularity" type: typeType code: 'Opsg'];
    return constantObj;
}

+ (OPConstant *)script {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"script" type: typeType code: 'scpt'];
    return constantObj;
}

+ (OPConstant *)selectedResources {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"selectedResources" type: typeType code: 'OPSR'];
    return constantObj;
}

+ (OPConstant *)selectedTasks {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"selectedTasks" type: typeType code: 'OPST'];
    return constantObj;
}

+ (OPConstant *)shortDescription {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"shortDescription" type: typeType code: 'OPde'];
    return constantObj;
}

+ (OPConstant *)shortFloat {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"shortFloat" type: typeType code: 'sing'];
    return constantObj;
}

+ (OPConstant *)shortInteger {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"shortInteger" type: typeType code: 'shor'];
    return constantObj;
}

+ (OPConstant *)showAllRows {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"showAllRows" type: typeType code: 'OPar'];
    return constantObj;
}

+ (OPConstant *)size {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"size" type: typeType code: 'ptsz'];
    return constantObj;
}

+ (OPConstant *)specificDate {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"specificDate" type: typeType code: 'OPdd'];
    return constantObj;
}

+ (OPConstant *)squareFeet {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"squareFeet" type: typeType code: 'sqft'];
    return constantObj;
}

+ (OPConstant *)squareKilometers {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"squareKilometers" type: typeType code: 'sqkm'];
    return constantObj;
}

+ (OPConstant *)squareMeters {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"squareMeters" type: typeType code: 'sqrm'];
    return constantObj;
}

+ (OPConstant *)squareMiles {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"squareMiles" type: typeType code: 'sqmi'];
    return constantObj;
}

+ (OPConstant *)squareYards {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"squareYards" type: typeType code: 'sqyd'];
    return constantObj;
}

+ (OPConstant *)standardTaskStyle {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"standardTaskStyle" type: typeType code: 'OPtS'];
    return constantObj;
}

+ (OPConstant *)startTime {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"startTime" type: typeType code: 'OPps'];
    return constantObj;
}

+ (OPConstant *)startingBaselineDate {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"startingBaselineDate" type: typeType code: 'Otsp'];
    return constantObj;
}

+ (OPConstant *)startingBaselineVariance {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"startingBaselineVariance" type: typeType code: 'Otsv'];
    return constantObj;
}

+ (OPConstant *)startingConstraintDate {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"startingConstraintDate" type: typeType code: 'Otsc'];
    return constantObj;
}

+ (OPConstant *)startingDate {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"startingDate" type: typeType code: 'Opsd'];
    return constantObj;
}

+ (OPConstant *)startingDateLocked {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"startingDateLocked" type: typeType code: 'Otsl'];
    return constantObj;
}

+ (OPConstant *)startingPage {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"startingPage" type: typeType code: 'lwfp'];
    return constantObj;
}

+ (OPConstant *)staticCost {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"staticCost" type: typeType code: 'OPSC'];
    return constantObj;
}

+ (OPConstant *)string {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"string" type: typeType code: 'TEXT'];
    return constantObj;
}

+ (OPConstant *)style {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"style" type: typeType code: 'OSst'];
    return constantObj;
}

+ (OPConstant *)styledClipboardText {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"styledClipboardText" type: typeType code: 'styl'];
    return constantObj;
}

+ (OPConstant *)styledText {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"styledText" type: typeType code: 'STXT'];
    return constantObj;
}

+ (OPConstant *)suiteInfo {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"suiteInfo" type: typeType code: 'suin'];
    return constantObj;
}

+ (OPConstant *)symbol {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"symbol" type: typeType code: 'OPcs'];
    return constantObj;
}

+ (OPConstant *)targetPrinter {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"targetPrinter" type: typeType code: 'trpr'];
    return constantObj;
}

+ (OPConstant *)task {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"task" type: typeType code: 'Optk'];
    return constantObj;
}

+ (OPConstant *)taskColumns {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"taskColumns" type: typeType code: 'OPTC'];
    return constantObj;
}

+ (OPConstant *)taskStatus {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"taskStatus" type: typeType code: 'OPTs'];
    return constantObj;
}

+ (OPConstant *)taskType {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"taskType" type: typeType code: 'OPTT'];
    return constantObj;
}

+ (OPConstant *)template {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"template" type: typeType code: 'OPTE'];
    return constantObj;
}

+ (OPConstant *)textStyleInfo {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"textStyleInfo" type: typeType code: 'tsty'];
    return constantObj;
}

+ (OPConstant *)title {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"title" type: typeType code: 'OPti'];
    return constantObj;
}

+ (OPConstant *)totalCost {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"totalCost" type: typeType code: 'OPtc'];
    return constantObj;
}

+ (OPConstant *)totalSeconds {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"totalSeconds" type: typeType code: 'OPth'];
    return constantObj;
}

+ (OPConstant *)totalUses {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"totalUses" type: typeType code: 'OPtu'];
    return constantObj;
}

+ (OPConstant *)typeClass {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"typeClass" type: typeType code: 'type'];
    return constantObj;
}

+ (OPConstant *)undetermined {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"undetermined" type: typeType code: 'Opps'];
    return constantObj;
}

+ (OPConstant *)unicodeText {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"unicodeText" type: typeType code: 'utxt'];
    return constantObj;
}

+ (OPConstant *)units {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"units" type: typeType code: 'Oaan'];
    return constantObj;
}

+ (OPConstant *)unsignedInteger {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"unsignedInteger" type: typeType code: 'magn'];
    return constantObj;
}

+ (OPConstant *)utf16Text {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"utf16Text" type: typeType code: 'ut16'];
    return constantObj;
}

+ (OPConstant *)utf8Text {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"utf8Text" type: typeType code: 'utf8'];
    return constantObj;
}

+ (OPConstant *)value {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"value" type: typeType code: 'OPvl'];
    return constantObj;
}

+ (OPConstant *)version {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"version" type: typeType code: 'vers'];
    return constantObj;
}

+ (OPConstant *)version_ {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"version_" type: typeType code: 'vers'];
    return constantObj;
}

+ (OPConstant *)viewsToInclude {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"viewsToInclude" type: typeType code: 'OPev'];
    return constantObj;
}

+ (OPConstant *)violation {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"violation" type: typeType code: 'Opis'];
    return constantObj;
}

+ (OPConstant *)violationCount {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"violationCount" type: typeType code: 'Opec'];
    return constantObj;
}

+ (OPConstant *)violationType {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"violationType" type: typeType code: 'OPty'];
    return constantObj;
}

+ (OPConstant *)visible {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"visible" type: typeType code: 'pvis'];
    return constantObj;
}

+ (OPConstant *)weekDaySchedule {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"weekDaySchedule" type: typeType code: 'OPsd'];
    return constantObj;
}

+ (OPConstant *)weekDayScheduleOrCalendarDaySchedule {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"weekDayScheduleOrCalendarDaySchedule" type: typeType code: 'cct3'];
    return constantObj;
}

+ (OPConstant *)window {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"window" type: typeType code: 'cwin'];
    return constantObj;
}

+ (OPConstant *)word {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"word" type: typeType code: 'cwor'];
    return constantObj;
}

+ (OPConstant *)workTimes {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"workTimes" type: typeType code: 'OPpt'];
    return constantObj;
}

+ (OPConstant *)writingCode {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"writingCode" type: typeType code: 'psct'];
    return constantObj;
}

+ (OPConstant *)yards {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"yards" type: typeType code: 'yard'];
    return constantObj;
}

+ (OPConstant *)zoomable {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"zoomable" type: typeType code: 'iszm'];
    return constantObj;
}

+ (OPConstant *)zoomed {
    static OPConstant *constantObj;
    if (!constantObj)
        constantObj = [OPConstant constantWithName: @"zoomed" type: typeType code: 'pzum'];
    return constantObj;
}

@end


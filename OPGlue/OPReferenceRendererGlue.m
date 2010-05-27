/*
 * OPReferenceRendererGlue.m
 * /Applications/OmniPlan.app
 * osaglue 0.5.2
 *
 */

#import "OPReferenceRendererGlue.h"

@implementation OPReferenceRenderer
- (NSString *)propertyByCode:(OSType)code {
    switch (code) {
        case 'OPac': return @"actions";
        case 'Orai': return @"addressId";
        case 'OPAT': return @"availableTemplates";
        case 'OPbs': return @"baseStyle";
        case 'pbnd': return @"bounds";
        case 'OPCC': return @"calendarColumns";
        case 'Odcr': return @"canRedo";
        case 'Odcu': return @"canUndo";
        case 'pcls': return @"class_";
        case 'hclb': return @"closeable";
        case 'OPcc': return @"code";
        case 'lwcl': return @"collating";
        case 'colr': return @"color";
        case 'OPco': return @"completed";
        case 'Otce': return @"completedEffort";
        case 'OPcS': return @"completedTaskStyle";
        case 'ctnr': return @"container";
        case 'lwcp': return @"copies";
        case 'OPCh': return @"costPerHour";
        case 'OPCu': return @"costPerUse";
        case 'OPcp': return @"critical";
        case 'OPcu': return @"currency";
        case 'Opcd': return @"customData";
        case 'OPDT': return @"defaultTemplate";
        case 'OSdv': return @"defaultValue";
        case 'OSds': return @"definingStyle";
        case 'OPdk': return @"dependencyType";
        case 'Opdd': return @"dependentTask";
        case 'OPCt': return @"diagramType";
        case 'docu': return @"document";
        case 'Otdu': return @"duration";
        case 'OPef': return @"efficiency";
        case 'Otef': return @"effort";
        case 'Orem': return @"emailAddress";
        case 'OPpe': return @"endTime";
        case 'Otep': return @"endingBaselineDate";
        case 'Otev': return @"endingBaselineVariance";
        case 'Otec': return @"endingConstraintDate";
        case 'Oped': return @"endingDate";
        case 'Otel': return @"endingDateLocked";
        case 'lwlp': return @"endingPage";
        case 'lweh': return @"errorHandling";
        case 'Opex': return @"expanded";
        case 'faxn': return @"faxNumber";
        case 'file': return @"file";
        case 'Opfo': return @"filtered";
        case 'font': return @"font";
        case 'pisf': return @"frontmost";
        case 'Opgb': return @"ganttBackgroundColor";
        case 'Opgc': return @"ganttCriticalPathColor";
        case 'Opgs': return @"ganttDateScaleSeparatorColor";
        case 'Opgo': return @"ganttOffDayColor";
        case 'Opgr': return @"ganttResourceDependencyLineColor";
        case 'Opgd': return @"ganttTaskDependencyLineColor";
        case 'Opgt': return @"ganttTodayColor";
        case 'Orpa': return @"group";
        case 'OPtS': return @"groupTaskStyle";
        case 'OPOV': return @"hasOverview";
        case 'OPht': return @"html";
        case 'OPit': return @"iCalTodo";
        case 'ID  ': return @"id_";
        case 'OPig': return @"includeTaskGroups";
        case 'pidx': return @"index";
        case 'OPlp': return @"leadPercentage";
        case 'OPlt': return @"leadTime";
        case 'OPmS': return @"milestoneTaskStyle";
        case 'ismn': return @"minimizable";
        case 'pmnd': return @"minimized";
        case 'imod': return @"modified";
        case 'pnam': return @"name";
        case 'Opnt': return @"note";
        case 'Opne': return @"noteExpanded";
        case 'OPnS': return @"noteStyle";
        case 'Orna': return @"number";
        case 'Odep': return @"outlineDepth";
        case 'Onum': return @"outlineNumber";
        case 'lwla': return @"pagesAcross";
        case 'lwld': return @"pagesDown";
        case 'Otgr': return @"parentTask";
        case 'Oppp': return @"prerequisiteTask";
        case 'Otpr': return @"priority";
        case 'OPpj': return @"project";
        case 'pALL': return @"properties";
        case 'OPfe': return @"recalculatesDuration";
        case 'OPre': return @"recalculatesEffort";
        case 'Oter': return @"remainingEffort";
        case 'Otrt': return @"reserveTime";
        case 'Othr': return @"reservingTime";
        case 'prsz': return @"resizable";
        case 'Oprs': return @"resource";
        case 'OPRC': return @"resourceColumns";
        case 'OPrc': return @"resourceCost";
        case 'OPrS': return @"resourceStyle";
        case 'Orty': return @"resourceType";
        case 'OPsc': return @"schedule";
        case 'Opsg': return @"schedulingGranularity";
        case 'OPSR': return @"selectedResources";
        case 'OPST': return @"selectedTasks";
        case 'OPde': return @"shortDescription";
        case 'OPar': return @"showAllRows";
        case 'ptsz': return @"size";
        case 'OPdd': return @"specificDate";
        case 'OPps': return @"startTime";
        case 'Otsp': return @"startingBaselineDate";
        case 'Otsv': return @"startingBaselineVariance";
        case 'Otsc': return @"startingConstraintDate";
        case 'Opsd': return @"startingDate";
        case 'Otsl': return @"startingDateLocked";
        case 'lwfp': return @"startingPage";
        case 'OPSC': return @"staticCost";
        case 'OSst': return @"style";
        case 'OPcs': return @"symbol";
        case 'trpr': return @"targetPrinter";
        case 'Optk': return @"task";
        case 'OPTC': return @"taskColumns";
        case 'OPTs': return @"taskStatus";
        case 'OPTT': return @"taskType";
        case 'OPTE': return @"template";
        case 'OPti': return @"title";
        case 'OPtc': return @"totalCost";
        case 'OPth': return @"totalSeconds";
        case 'OPtu': return @"totalUses";
        case 'Opps': return @"undetermined";
        case 'Oaan': return @"units";
        case 'OPvl': return @"value";
        case 'vers': return @"version_";
        case 'OPev': return @"viewsToInclude";
        case 'Opec': return @"violationCount";
        case 'OPty': return @"violationType";
        case 'pvis': return @"visible";
        case 'OPpt': return @"workTimes";
        case 'iszm': return @"zoomable";
        case 'pzum': return @"zoomed";
        default: return nil;
    }
}

- (NSString *)elementByCode:(OSType)code {
    switch (code) {
        case 'capp': return @"applications";
        case 'Opas': return @"assignments";
        case 'atts': return @"attachments";
        case 'catr': return @"attributeRuns";
        case 'OSsa': return @"attributes";
        case 'OPse': return @"calendarDaySchedules";
        case 'cha ': return @"characters";
        case 'Opcr': return @"childResources";
        case 'Opct': return @"childTasks";
        case 'cRGB': return @"color";
        case 'OPcu': return @"currencies";
        case 'OPCP': return @"customDataEntries";
        case 'Opdp': return @"dependencies";
        case 'Opds': return @"dependents";
        case 'docu': return @"documents";
        case 'OPEc': return @"exportSettings";
        case 'cct0': return @"fileOrListOfFile";
        case 'cct2': return @"fileOrText";
        case 'cobj': return @"items";
        case 'cct1': return @"listOfFileOrSpecifier";
        case 'cct4': return @"listOfSpecifierOrSpecifier";
        case 'Opms': return @"milestones";
        case 'OSns': return @"namedStyles";
        case 'cpar': return @"paragraphs";
        case 'Oprq': return @"prerequisites";
        case 'pset': return @"printSettings";
        case 'OPpj': return @"projects";
        case 'cct5': return @"realOrTextOrColorOrIntegerOrListOfReal";
        case 'Oprs': return @"resources";
        case 'ctxt': return @"richText";
        case 'OPsc': return @"schedules";
        case 'OSst': return @"styles";
        case 'Optk': return @"tasks";
        case 'Opis': return @"violations";
        case 'cct3': return @"weekDayScheduleOrCalendarDaySchedule";
        case 'OPsd': return @"weekDaySchedules";
        case 'cwin': return @"windows";
        case 'cwor': return @"words";
        default: return nil;
    }
}

- (NSString *)prefix {
    return @"OP";
}

@end


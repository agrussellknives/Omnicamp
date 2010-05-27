/*
 * OPReferenceGlue.m
 * /Applications/OmniPlan.app
 * osaglue 0.5.2
 *
 */

#import "OPReferenceGlue.h"

@implementation OPReference

/* +app, +con, +its methods can be used in place of OPApp, OPCon, OPIts macros */

+ (OPReference *)app {
    return [self referenceWithAppData: nil aemReference: AEMApp];
}

+ (OPReference *)con {
    return [self referenceWithAppData: nil aemReference: AEMCon];
}

+ (OPReference *)its {
    return [self referenceWithAppData: nil aemReference: AEMIts];
}


/* ********************************* */

- (NSString *)description {
    return [OPReferenceRenderer formatObject: AS_aemReference appData: AS_appData];
}


/* Commands */

- (OPGetURLCommand *)GetURL {
    return [OPGetURLCommand commandWithAppData: AS_appData
                         eventClass: 'GURL'
                            eventID: 'GURL'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPGetURLCommand *)GetURL:(id)directParameter {
    return [OPGetURLCommand commandWithAppData: AS_appData
                         eventClass: 'GURL'
                            eventID: 'GURL'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPActivateCommand *)activate {
    return [OPActivateCommand commandWithAppData: AS_appData
                         eventClass: 'misc'
                            eventID: 'actv'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPActivateCommand *)activate:(id)directParameter {
    return [OPActivateCommand commandWithAppData: AS_appData
                         eventClass: 'misc'
                            eventID: 'actv'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPAddCommand *)add {
    return [OPAddCommand commandWithAppData: AS_appData
                         eventClass: 'OFss'
                            eventID: 'iadd'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPAddCommand *)add:(id)directParameter {
    return [OPAddCommand commandWithAppData: AS_appData
                         eventClass: 'OFss'
                            eventID: 'iadd'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPAddWorkTimeCommand *)addWorkTime {
    return [OPAddWorkTimeCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'ADDS'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPAddWorkTimeCommand *)addWorkTime:(id)directParameter {
    return [OPAddWorkTimeCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'ADDS'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPAssignCommand *)assign {
    return [OPAssignCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'ASSN'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPAssignCommand *)assign:(id)directParameter {
    return [OPAssignCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'ASSN'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPBaselineCommand *)baseline {
    return [OPBaselineCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'BASE'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPBaselineCommand *)baseline:(id)directParameter {
    return [OPBaselineCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'BASE'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPCloseCommand *)close {
    return [OPCloseCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'clos'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPCloseCommand *)close:(id)directParameter {
    return [OPCloseCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'clos'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPCountCommand *)count {
    return [OPCountCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'cnte'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPCountCommand *)count:(id)directParameter {
    return [OPCountCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'cnte'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPDeleteCommand *)delete {
    return [OPDeleteCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'delo'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPDeleteCommand *)delete:(id)directParameter {
    return [OPDeleteCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'delo'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPDependCommand *)depend {
    return [OPDependCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'SCHD'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPDependCommand *)depend:(id)directParameter {
    return [OPDependCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'SCHD'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPDuplicateCommand *)duplicate {
    return [OPDuplicateCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'clon'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPDuplicateCommand *)duplicate:(id)directParameter {
    return [OPDuplicateCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'clon'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPExistsCommand *)exists {
    return [OPExistsCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'doex'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPExistsCommand *)exists:(id)directParameter {
    return [OPExistsCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'doex'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPExportCommand *)export {
    return [OPExportCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'xprt'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPExportCommand *)export:(id)directParameter {
    return [OPExportCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'xprt'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPFixCommand *)fix {
    return [OPFixCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'FIX '
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPFixCommand *)fix:(id)directParameter {
    return [OPFixCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'FIX '
                    directParameter: directParameter
                    parentReference: self];
}

- (OPGetCommand *)get {
    return [OPGetCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'getd'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPGetCommand *)get:(id)directParameter {
    return [OPGetCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'getd'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPLaunchCommand *)launch {
    return [OPLaunchCommand commandWithAppData: AS_appData
                         eventClass: 'ascr'
                            eventID: 'noop'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPLaunchCommand *)launch:(id)directParameter {
    return [OPLaunchCommand commandWithAppData: AS_appData
                         eventClass: 'ascr'
                            eventID: 'noop'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPLevelCommand *)level {
    return [OPLevelCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'LEVL'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPLevelCommand *)level:(id)directParameter {
    return [OPLevelCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'LEVL'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPLookupCommand *)lookup {
    return [OPLookupCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'LOOK'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPLookupCommand *)lookup:(id)directParameter {
    return [OPLookupCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'LOOK'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPMakeCommand *)make {
    return [OPMakeCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'crel'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPMakeCommand *)make:(id)directParameter {
    return [OPMakeCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'crel'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPMoveCommand *)move {
    return [OPMoveCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'move'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPMoveCommand *)move:(id)directParameter {
    return [OPMoveCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'move'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPOpenCommand *)open {
    return [OPOpenCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'odoc'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPOpenCommand *)open:(id)directParameter {
    return [OPOpenCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'odoc'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPOpenLocationCommand *)openLocation {
    return [OPOpenLocationCommand commandWithAppData: AS_appData
                         eventClass: 'GURL'
                            eventID: 'GURL'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPOpenLocationCommand *)openLocation:(id)directParameter {
    return [OPOpenLocationCommand commandWithAppData: AS_appData
                         eventClass: 'GURL'
                            eventID: 'GURL'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPOpen_Command *)open_ {
    return [OPOpen_Command commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'Fopn'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPOpen_Command *)open_:(id)directParameter {
    return [OPOpen_Command commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'Fopn'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPPrintCommand *)print {
    return [OPPrintCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'pdoc'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPPrintCommand *)print:(id)directParameter {
    return [OPPrintCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'pdoc'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPQuitCommand *)quit {
    return [OPQuitCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'quit'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPQuitCommand *)quit:(id)directParameter {
    return [OPQuitCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'quit'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPRedoCommand *)redo {
    return [OPRedoCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'REDO'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPRedoCommand *)redo:(id)directParameter {
    return [OPRedoCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'REDO'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPRemoveCommand *)remove {
    return [OPRemoveCommand commandWithAppData: AS_appData
                         eventClass: 'OFss'
                            eventID: 'remv'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPRemoveCommand *)remove:(id)directParameter {
    return [OPRemoveCommand commandWithAppData: AS_appData
                         eventClass: 'OFss'
                            eventID: 'remv'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPReopenCommand *)reopen {
    return [OPReopenCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'rapp'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPReopenCommand *)reopen:(id)directParameter {
    return [OPReopenCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'rapp'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPRunCommand *)run {
    return [OPRunCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'oapp'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPRunCommand *)run:(id)directParameter {
    return [OPRunCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'oapp'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPSaveCommand *)save {
    return [OPSaveCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'save'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPSaveCommand *)save:(id)directParameter {
    return [OPSaveCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'save'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPSetCommand *)set {
    return [OPSetCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'setd'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPSetCommand *)set:(id)directParameter {
    return [OPSetCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'setd'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPSubtractWorkTimeCommand *)subtractWorkTime {
    return [OPSubtractWorkTimeCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'SUBS'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPSubtractWorkTimeCommand *)subtractWorkTime:(id)directParameter {
    return [OPSubtractWorkTimeCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'SUBS'
                    directParameter: directParameter
                    parentReference: self];
}

- (OPUndoCommand *)undo {
    return [OPUndoCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'UNDO'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (OPUndoCommand *)undo:(id)directParameter {
    return [OPUndoCommand commandWithAppData: AS_appData
                         eventClass: 'OPLN'
                            eventID: 'UNDO'
                    directParameter: directParameter
                    parentReference: self];
}


/* Elements */

- (OPReference *)applications {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'capp']];
}

- (OPReference *)assignments {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'Opas']];
}

- (OPReference *)attachments {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'atts']];
}

- (OPReference *)attributeRuns {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'catr']];
}

- (OPReference *)attributes {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'OSsa']];
}

- (OPReference *)calendarDaySchedules {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'OPse']];
}

- (OPReference *)characters {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cha ']];
}

- (OPReference *)childResources {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'Opcr']];
}

- (OPReference *)childTasks {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'Opct']];
}

- (OPReference *)currencies {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'OPcu']];
}

- (OPReference *)customDataEntries {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'OPCP']];
}

- (OPReference *)dependencies {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'Opdp']];
}

- (OPReference *)dependents {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'Opds']];
}

- (OPReference *)documents {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'docu']];
}

- (OPReference *)exportSettings {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'OPEc']];
}

- (OPReference *)fileOrListOfFile {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cct0']];
}

- (OPReference *)fileOrText {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cct2']];
}

- (OPReference *)items {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cobj']];
}

- (OPReference *)listOfFileOrSpecifier {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cct1']];
}

- (OPReference *)listOfSpecifierOrSpecifier {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cct4']];
}

- (OPReference *)milestones {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'Opms']];
}

- (OPReference *)namedStyles {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'OSns']];
}

- (OPReference *)paragraphs {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cpar']];
}

- (OPReference *)prerequisites {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'Oprq']];
}

- (OPReference *)printSettings {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'pset']];
}

- (OPReference *)projects {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'OPpj']];
}

- (OPReference *)realOrTextOrColorOrIntegerOrListOfReal {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cct5']];
}

- (OPReference *)resources {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'Oprs']];
}

- (OPReference *)richText {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'ctxt']];
}

- (OPReference *)schedules {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'OPsc']];
}

- (OPReference *)styles {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'OSst']];
}

- (OPReference *)tasks {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'Optk']];
}

- (OPReference *)violations {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'Opis']];
}

- (OPReference *)weekDayScheduleOrCalendarDaySchedule {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cct3']];
}

- (OPReference *)weekDaySchedules {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'OPsd']];
}

- (OPReference *)windows {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cwin']];
}

- (OPReference *)words {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cwor']];
}


/* Properties */

- (OPReference *)actions {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPac']];
}

- (OPReference *)addressId {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Orai']];
}

- (OPReference *)availableTemplates {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPAT']];
}

- (OPReference *)baseStyle {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPbs']];
}

- (OPReference *)bounds {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pbnd']];
}

- (OPReference *)calendarColumns {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPCC']];
}

- (OPReference *)canRedo {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Odcr']];
}

- (OPReference *)canUndo {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Odcu']];
}

- (OPReference *)class_ {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pcls']];
}

- (OPReference *)closeable {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'hclb']];
}

- (OPReference *)code {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPcc']];
}

- (OPReference *)collating {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwcl']];
}

- (OPReference *)color {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'colr']];
}

- (OPReference *)columnTitleStyle {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPtS']];
}

- (OPReference *)completed {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPco']];
}

- (OPReference *)completedEffort {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otce']];
}

- (OPReference *)completedTaskStyle {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPcS']];
}

- (OPReference *)container {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'ctnr']];
}

- (OPReference *)copies {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwcp']];
}

- (OPReference *)costPerHour {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPCh']];
}

- (OPReference *)costPerUse {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPCu']];
}

- (OPReference *)critical {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPcp']];
}

- (OPReference *)currency {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPcu']];
}

- (OPReference *)customData {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opcd']];
}

- (OPReference *)defaultTemplate {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPDT']];
}

- (OPReference *)defaultValue {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OSdv']];
}

- (OPReference *)definingStyle {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OSds']];
}

- (OPReference *)dependencyType {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPdk']];
}

- (OPReference *)dependentTask {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opdd']];
}

- (OPReference *)diagramType {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPCt']];
}

- (OPReference *)document {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'docu']];
}

- (OPReference *)duration {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otdu']];
}

- (OPReference *)efficiency {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPef']];
}

- (OPReference *)effort {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otef']];
}

- (OPReference *)emailAddress {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Orem']];
}

- (OPReference *)endTime {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPpe']];
}

- (OPReference *)endingBaselineDate {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otep']];
}

- (OPReference *)endingBaselineVariance {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otev']];
}

- (OPReference *)endingConstraintDate {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otec']];
}

- (OPReference *)endingDate {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Oped']];
}

- (OPReference *)endingDateLocked {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otel']];
}

- (OPReference *)endingPage {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwlp']];
}

- (OPReference *)errorHandling {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lweh']];
}

- (OPReference *)expanded {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opex']];
}

- (OPReference *)faxNumber {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'faxn']];
}

- (OPReference *)file {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'file']];
}

- (OPReference *)filtered {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opfo']];
}

- (OPReference *)font {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'font']];
}

- (OPReference *)frontmost {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pisf']];
}

- (OPReference *)ganttBackgroundColor {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opgb']];
}

- (OPReference *)ganttCriticalPathColor {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opgc']];
}

- (OPReference *)ganttDateScaleSeparatorColor {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opgs']];
}

- (OPReference *)ganttOffDayColor {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opgo']];
}

- (OPReference *)ganttResourceDependencyLineColor {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opgr']];
}

- (OPReference *)ganttTaskDependencyLineColor {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opgd']];
}

- (OPReference *)ganttTodayColor {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opgt']];
}

- (OPReference *)group {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Orpa']];
}

- (OPReference *)groupTaskStyle {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPtS']];
}

- (OPReference *)hasOverview {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPOV']];
}

- (OPReference *)html {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPht']];
}

- (OPReference *)iCalTodo {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPit']];
}

- (OPReference *)id_ {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'ID  ']];
}

- (OPReference *)includeTaskGroups {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPig']];
}

- (OPReference *)index {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pidx']];
}

- (OPReference *)leadPercentage {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPlp']];
}

- (OPReference *)leadTime {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPlt']];
}

- (OPReference *)milestoneTaskStyle {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPmS']];
}

- (OPReference *)minimizable {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'ismn']];
}

- (OPReference *)minimized {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pmnd']];
}

- (OPReference *)modified {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'imod']];
}

- (OPReference *)name {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pnam']];
}

- (OPReference *)note {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opnt']];
}

- (OPReference *)noteExpanded {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opne']];
}

- (OPReference *)noteStyle {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPnS']];
}

- (OPReference *)number {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Orna']];
}

- (OPReference *)outlineDepth {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Odep']];
}

- (OPReference *)outlineNumber {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Onum']];
}

- (OPReference *)overdueTaskStyle {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPtS']];
}

- (OPReference *)pagesAcross {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwla']];
}

- (OPReference *)pagesDown {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwld']];
}

- (OPReference *)parentTask {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otgr']];
}

- (OPReference *)prerequisiteTask {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Oppp']];
}

- (OPReference *)priority {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otpr']];
}

- (OPReference *)project {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPpj']];
}

- (OPReference *)properties {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pALL']];
}

- (OPReference *)recalculatesDuration {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPfe']];
}

- (OPReference *)recalculatesEffort {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPre']];
}

- (OPReference *)remainingEffort {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Oter']];
}

- (OPReference *)reserveTime {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otrt']];
}

- (OPReference *)reservingTime {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Othr']];
}

- (OPReference *)resizable {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'prsz']];
}

- (OPReference *)resource {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Oprs']];
}

- (OPReference *)resourceColumns {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPRC']];
}

- (OPReference *)resourceCost {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPrc']];
}

- (OPReference *)resourceStyle {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPrS']];
}

- (OPReference *)resourceType {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Orty']];
}

- (OPReference *)schedule {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPsc']];
}

- (OPReference *)schedulingGranularity {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opsg']];
}

- (OPReference *)selectedResources {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPSR']];
}

- (OPReference *)selectedTasks {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPST']];
}

- (OPReference *)shortDescription {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPde']];
}

- (OPReference *)showAllRows {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPar']];
}

- (OPReference *)size {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'ptsz']];
}

- (OPReference *)specificDate {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPdd']];
}

- (OPReference *)standardTaskStyle {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPtS']];
}

- (OPReference *)startTime {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPps']];
}

- (OPReference *)startingBaselineDate {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otsp']];
}

- (OPReference *)startingBaselineVariance {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otsv']];
}

- (OPReference *)startingConstraintDate {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otsc']];
}

- (OPReference *)startingDate {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opsd']];
}

- (OPReference *)startingDateLocked {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Otsl']];
}

- (OPReference *)startingPage {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwfp']];
}

- (OPReference *)staticCost {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPSC']];
}

- (OPReference *)style {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OSst']];
}

- (OPReference *)symbol {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPcs']];
}

- (OPReference *)targetPrinter {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'trpr']];
}

- (OPReference *)task {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Optk']];
}

- (OPReference *)taskColumns {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPTC']];
}

- (OPReference *)taskStatus {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPTs']];
}

- (OPReference *)taskType {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPTT']];
}

- (OPReference *)template {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPTE']];
}

- (OPReference *)title {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPti']];
}

- (OPReference *)totalCost {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPtc']];
}

- (OPReference *)totalSeconds {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPth']];
}

- (OPReference *)totalUses {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPtu']];
}

- (OPReference *)undetermined {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opps']];
}

- (OPReference *)units {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Oaan']];
}

- (OPReference *)value {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPvl']];
}

- (OPReference *)version_ {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'vers']];
}

- (OPReference *)viewsToInclude {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPev']];
}

- (OPReference *)violationCount {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'Opec']];
}

- (OPReference *)violationType {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPty']];
}

- (OPReference *)visible {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pvis']];
}

- (OPReference *)workTimes {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'OPpt']];
}

- (OPReference *)zoomable {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'iszm']];
}

- (OPReference *)zoomed {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pzum']];
}


/* ********************************* */


/* ordinal selectors */

- (OPReference *)first {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference first]];
}

- (OPReference *)middle {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference middle]];
}

- (OPReference *)last {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference last]];
}

- (OPReference *)any {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference any]];
}


/* by-index, by-name, by-id selectors */

- (OPReference *)at:(int)index {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference at: index]];
}

- (OPReference *)byIndex:(id)index {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference byIndex: index]];
}

- (OPReference *)byName:(id)name {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference byName: name]];
}

- (OPReference *)byID:(id)id_ {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference byID: id_]];
}


/* by-relative-position selectors */

- (OPReference *)previous:(ASConstant *)class_ {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference previous: [class_ AS_code]]];
}

- (OPReference *)next:(ASConstant *)class_ {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference next: [class_ AS_code]]];
}


/* by-range selector */

- (OPReference *)at:(int)fromIndex to:(int)toIndex {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference at: fromIndex to: toIndex]];
}

- (OPReference *)byRange:(id)fromObject to:(id)toObject {
    // takes two con-based references, with other values being expanded as necessary
    if ([fromObject isKindOfClass: [OPReference class]])
        fromObject = [fromObject AS_aemReference];
    if ([toObject isKindOfClass: [OPReference class]])
        toObject = [toObject AS_aemReference];
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference byRange: fromObject to: toObject]];
}


/* by-test selector */

- (OPReference *)byTest:(OPReference *)testReference {
    return [OPReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference byTest: [testReference AS_aemReference]]];
}


/* insertion location selectors */

- (OPReference *)beginning {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference beginning]];
}

- (OPReference *)end {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference end]];
}

- (OPReference *)before {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference before]];
}

- (OPReference *)after {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference after]];
}


/* Comparison and logic tests */

- (OPReference *)greaterThan:(id)object {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference greaterThan: object]];
}

- (OPReference *)greaterOrEquals:(id)object {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference greaterOrEquals: object]];
}

- (OPReference *)equals:(id)object {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference equals: object]];
}

- (OPReference *)notEquals:(id)object {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference notEquals: object]];
}

- (OPReference *)lessThan:(id)object {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference lessThan: object]];
}

- (OPReference *)lessOrEquals:(id)object {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference lessOrEquals: object]];
}

- (OPReference *)beginsWith:(id)object {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference beginsWith: object]];
}

- (OPReference *)endsWith:(id)object {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference endsWith: object]];
}

- (OPReference *)contains:(id)object {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference contains: object]];
}

- (OPReference *)isIn:(id)object {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference isIn: object]];
}

- (OPReference *)AND:(id)remainingOperands {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference AND: remainingOperands]];
}

- (OPReference *)OR:(id)remainingOperands {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference OR: remainingOperands]];
}

- (OPReference *)NOT {
    return [OPReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference NOT]];
}

@end


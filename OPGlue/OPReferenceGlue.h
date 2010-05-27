/*
 * OPReferenceGlue.h
 * /Applications/OmniPlan.app
 * osaglue 0.5.2
 *
 */

#import <Foundation/Foundation.h>
#import "Appscript/Appscript.h"
#import "OPCommandGlue.h"
#import "OPReferenceRendererGlue.h"
#define OPApp ((OPReference *)[OPReference referenceWithAppData: nil aemReference: AEMApp])
#define OPCon ((OPReference *)[OPReference referenceWithAppData: nil aemReference: AEMCon])
#define OPIts ((OPReference *)[OPReference referenceWithAppData: nil aemReference: AEMIts])

@interface OPReference : ASReference

/* +app, +con, +its methods can be used in place of OPApp, OPCon, OPIts macros */

+ (OPReference *)app;
+ (OPReference *)con;
+ (OPReference *)its;

/* ********************************* */

- (NSString *)description;

/* Commands */

- (OPGetURLCommand *)GetURL;
- (OPGetURLCommand *)GetURL:(id)directParameter;
- (OPActivateCommand *)activate;
- (OPActivateCommand *)activate:(id)directParameter;
- (OPAddCommand *)add;
- (OPAddCommand *)add:(id)directParameter;
- (OPAddWorkTimeCommand *)addWorkTime;
- (OPAddWorkTimeCommand *)addWorkTime:(id)directParameter;
- (OPAssignCommand *)assign;
- (OPAssignCommand *)assign:(id)directParameter;
- (OPBaselineCommand *)baseline;
- (OPBaselineCommand *)baseline:(id)directParameter;
- (OPCloseCommand *)close;
- (OPCloseCommand *)close:(id)directParameter;
- (OPCountCommand *)count;
- (OPCountCommand *)count:(id)directParameter;
- (OPDeleteCommand *)delete;
- (OPDeleteCommand *)delete:(id)directParameter;
- (OPDependCommand *)depend;
- (OPDependCommand *)depend:(id)directParameter;
- (OPDuplicateCommand *)duplicate;
- (OPDuplicateCommand *)duplicate:(id)directParameter;
- (OPExistsCommand *)exists;
- (OPExistsCommand *)exists:(id)directParameter;
- (OPExportCommand *)export;
- (OPExportCommand *)export:(id)directParameter;
- (OPFixCommand *)fix;
- (OPFixCommand *)fix:(id)directParameter;
- (OPGetCommand *)get;
- (OPGetCommand *)get:(id)directParameter;
- (OPLaunchCommand *)launch;
- (OPLaunchCommand *)launch:(id)directParameter;
- (OPLevelCommand *)level;
- (OPLevelCommand *)level:(id)directParameter;
- (OPLookupCommand *)lookup;
- (OPLookupCommand *)lookup:(id)directParameter;
- (OPMakeCommand *)make;
- (OPMakeCommand *)make:(id)directParameter;
- (OPMoveCommand *)move;
- (OPMoveCommand *)move:(id)directParameter;
- (OPOpenCommand *)open;
- (OPOpenCommand *)open:(id)directParameter;
- (OPOpenLocationCommand *)openLocation;
- (OPOpenLocationCommand *)openLocation:(id)directParameter;
- (OPOpen_Command *)open_;
- (OPOpen_Command *)open_:(id)directParameter;
- (OPPrintCommand *)print;
- (OPPrintCommand *)print:(id)directParameter;
- (OPQuitCommand *)quit;
- (OPQuitCommand *)quit:(id)directParameter;
- (OPRedoCommand *)redo;
- (OPRedoCommand *)redo:(id)directParameter;
- (OPRemoveCommand *)remove;
- (OPRemoveCommand *)remove:(id)directParameter;
- (OPReopenCommand *)reopen;
- (OPReopenCommand *)reopen:(id)directParameter;
- (OPRunCommand *)run;
- (OPRunCommand *)run:(id)directParameter;
- (OPSaveCommand *)save;
- (OPSaveCommand *)save:(id)directParameter;
- (OPSetCommand *)set;
- (OPSetCommand *)set:(id)directParameter;
- (OPSubtractWorkTimeCommand *)subtractWorkTime;
- (OPSubtractWorkTimeCommand *)subtractWorkTime:(id)directParameter;
- (OPUndoCommand *)undo;
- (OPUndoCommand *)undo:(id)directParameter;

/* Elements */

- (OPReference *)applications;
- (OPReference *)assignments;
- (OPReference *)attachments;
- (OPReference *)attributeRuns;
- (OPReference *)attributes;
- (OPReference *)calendarDaySchedules;
- (OPReference *)characters;
- (OPReference *)childResources;
- (OPReference *)childTasks;
- (OPReference *)currencies;
- (OPReference *)customDataEntries;
- (OPReference *)dependencies;
- (OPReference *)dependents;
- (OPReference *)documents;
- (OPReference *)exportSettings;
- (OPReference *)fileOrListOfFile;
- (OPReference *)fileOrText;
- (OPReference *)items;
- (OPReference *)listOfFileOrSpecifier;
- (OPReference *)listOfSpecifierOrSpecifier;
- (OPReference *)milestones;
- (OPReference *)namedStyles;
- (OPReference *)paragraphs;
- (OPReference *)prerequisites;
- (OPReference *)printSettings;
- (OPReference *)projects;
- (OPReference *)realOrTextOrColorOrIntegerOrListOfReal;
- (OPReference *)resources;
- (OPReference *)richText;
- (OPReference *)schedules;
- (OPReference *)styles;
- (OPReference *)tasks;
- (OPReference *)violations;
- (OPReference *)weekDayScheduleOrCalendarDaySchedule;
- (OPReference *)weekDaySchedules;
- (OPReference *)windows;
- (OPReference *)words;

/* Properties */

- (OPReference *)actions;
- (OPReference *)addressId;
- (OPReference *)availableTemplates;
- (OPReference *)baseStyle;
- (OPReference *)bounds;
- (OPReference *)calendarColumns;
- (OPReference *)canRedo;
- (OPReference *)canUndo;
- (OPReference *)class_;
- (OPReference *)closeable;
- (OPReference *)code;
- (OPReference *)collating;
- (OPReference *)color;
- (OPReference *)columnTitleStyle;
- (OPReference *)completed;
- (OPReference *)completedEffort;
- (OPReference *)completedTaskStyle;
- (OPReference *)container;
- (OPReference *)copies;
- (OPReference *)costPerHour;
- (OPReference *)costPerUse;
- (OPReference *)critical;
- (OPReference *)currency;
- (OPReference *)customData;
- (OPReference *)defaultTemplate;
- (OPReference *)defaultValue;
- (OPReference *)definingStyle;
- (OPReference *)dependencyType;
- (OPReference *)dependentTask;
- (OPReference *)diagramType;
- (OPReference *)document;
- (OPReference *)duration;
- (OPReference *)efficiency;
- (OPReference *)effort;
- (OPReference *)emailAddress;
- (OPReference *)endTime;
- (OPReference *)endingBaselineDate;
- (OPReference *)endingBaselineVariance;
- (OPReference *)endingConstraintDate;
- (OPReference *)endingDate;
- (OPReference *)endingDateLocked;
- (OPReference *)endingPage;
- (OPReference *)errorHandling;
- (OPReference *)expanded;
- (OPReference *)faxNumber;
- (OPReference *)file;
- (OPReference *)filtered;
- (OPReference *)font;
- (OPReference *)frontmost;
- (OPReference *)ganttBackgroundColor;
- (OPReference *)ganttCriticalPathColor;
- (OPReference *)ganttDateScaleSeparatorColor;
- (OPReference *)ganttOffDayColor;
- (OPReference *)ganttResourceDependencyLineColor;
- (OPReference *)ganttTaskDependencyLineColor;
- (OPReference *)ganttTodayColor;
- (OPReference *)group;
- (OPReference *)groupTaskStyle;
- (OPReference *)hasOverview;
- (OPReference *)html;
- (OPReference *)iCalTodo;
- (OPReference *)id_;
- (OPReference *)includeTaskGroups;
- (OPReference *)index;
- (OPReference *)leadPercentage;
- (OPReference *)leadTime;
- (OPReference *)milestoneTaskStyle;
- (OPReference *)minimizable;
- (OPReference *)minimized;
- (OPReference *)modified;
- (OPReference *)name;
- (OPReference *)note;
- (OPReference *)noteExpanded;
- (OPReference *)noteStyle;
- (OPReference *)number;
- (OPReference *)outlineDepth;
- (OPReference *)outlineNumber;
- (OPReference *)overdueTaskStyle;
- (OPReference *)pagesAcross;
- (OPReference *)pagesDown;
- (OPReference *)parentTask;
- (OPReference *)prerequisiteTask;
- (OPReference *)priority;
- (OPReference *)project;
- (OPReference *)properties;
- (OPReference *)recalculatesDuration;
- (OPReference *)recalculatesEffort;
- (OPReference *)remainingEffort;
- (OPReference *)reserveTime;
- (OPReference *)reservingTime;
- (OPReference *)resizable;
- (OPReference *)resource;
- (OPReference *)resourceColumns;
- (OPReference *)resourceCost;
- (OPReference *)resourceStyle;
- (OPReference *)resourceType;
- (OPReference *)schedule;
- (OPReference *)schedulingGranularity;
- (OPReference *)selectedResources;
- (OPReference *)selectedTasks;
- (OPReference *)shortDescription;
- (OPReference *)showAllRows;
- (OPReference *)size;
- (OPReference *)specificDate;
- (OPReference *)standardTaskStyle;
- (OPReference *)startTime;
- (OPReference *)startingBaselineDate;
- (OPReference *)startingBaselineVariance;
- (OPReference *)startingConstraintDate;
- (OPReference *)startingDate;
- (OPReference *)startingDateLocked;
- (OPReference *)startingPage;
- (OPReference *)staticCost;
- (OPReference *)style;
- (OPReference *)symbol;
- (OPReference *)targetPrinter;
- (OPReference *)task;
- (OPReference *)taskColumns;
- (OPReference *)taskStatus;
- (OPReference *)taskType;
- (OPReference *)template;
- (OPReference *)title;
- (OPReference *)totalCost;
- (OPReference *)totalSeconds;
- (OPReference *)totalUses;
- (OPReference *)undetermined;
- (OPReference *)units;
- (OPReference *)value;
- (OPReference *)version_;
- (OPReference *)viewsToInclude;
- (OPReference *)violationCount;
- (OPReference *)violationType;
- (OPReference *)visible;
- (OPReference *)workTimes;
- (OPReference *)zoomable;
- (OPReference *)zoomed;

/* ********************************* */


/* ordinal selectors */

- (OPReference *)first;
- (OPReference *)middle;
- (OPReference *)last;
- (OPReference *)any;

/* by-index, by-name, by-id selectors */

- (OPReference *)at:(int)index;
- (OPReference *)byIndex:(id)index;
- (OPReference *)byName:(id)name;
- (OPReference *)byID:(id)id_;

/* by-relative-position selectors */

- (OPReference *)previous:(ASConstant *)class_;
- (OPReference *)next:(ASConstant *)class_;

/* by-range selector */

- (OPReference *)at:(int)fromIndex to:(int)toIndex;
- (OPReference *)byRange:(id)fromObject to:(id)toObject;

/* by-test selector */

- (OPReference *)byTest:(OPReference *)testReference;

/* insertion location selectors */

- (OPReference *)beginning;
- (OPReference *)end;
- (OPReference *)before;
- (OPReference *)after;

/* Comparison and logic tests */

- (OPReference *)greaterThan:(id)object;
- (OPReference *)greaterOrEquals:(id)object;
- (OPReference *)equals:(id)object;
- (OPReference *)notEquals:(id)object;
- (OPReference *)lessThan:(id)object;
- (OPReference *)lessOrEquals:(id)object;
- (OPReference *)beginsWith:(id)object;
- (OPReference *)endsWith:(id)object;
- (OPReference *)contains:(id)object;
- (OPReference *)isIn:(id)object;
- (OPReference *)AND:(id)remainingOperands;
- (OPReference *)OR:(id)remainingOperands;
- (OPReference *)NOT;
@end


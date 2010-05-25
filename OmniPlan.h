/*
 * OmniPlan.h
 */

#import <AppKit/AppKit.h>
#import <ScriptingBridge/ScriptingBridge.h>


@class OmniPlanApplication, OmniPlanDocument, OmniPlanWindow, OmniPlanRichText, OmniPlanCharacter, OmniPlanParagraph, OmniPlanWord, OmniPlanAttributeRun, OmniPlanProject, OmniPlanResource, OmniPlanTask, OmniPlanMilestone, OmniPlanChildTask, OmniPlanChildResource, OmniPlanAssignment, OmniPlanDependency, OmniPlanPrerequisite, OmniPlanDependent, OmniPlanViolation, OmniPlanCurrency, OmniPlanWeekDaySchedule, OmniPlanCalendarDaySchedule, OmniPlanSchedule, OmniPlanAttachment, OmniPlanCustomDataEntry, OmniPlanStyle, OmniPlanAttribute, OmniPlanNamedStyle;

typedef enum {
	OmniPlanSaveOptionsYes = 'yes ' /* Save the file. */,
	OmniPlanSaveOptionsNo = 'no  ' /* Do not save the file. */,
	OmniPlanSaveOptionsAsk = 'ask ' /* Ask the user whether or not to save the file. */
} OmniPlanSaveOptions;

typedef enum {
	OmniPlanExportViewTypeBothViews = 'OPv0' /* Both outline and gantt view */,
	OmniPlanExportViewTypeGanttOnly = 'OPv1' /* Gantt view only */,
	OmniPlanExportViewTypeOutlineOnly = 'OPv2' /* Outline view only */
} OmniPlanExportViewType;

typedef enum {
	OmniPlanGraffleDiagramTypeWorkBreakdownStructure = 'OPc0' /* Hierarchical organization of the tasks into groups. */,
	OmniPlanGraffleDiagramTypeActivityOnNodePERT = 'OPc1' /* PERT chart with tasks as boxes with dependency lines connecting them. */,
	OmniPlanGraffleDiagramTypeActivityOnArrowPERT = 'OPc2' /* PERT chart with tasks as arrows connecting project progress states. */
} OmniPlanGraffleDiagramType;

typedef enum {
	OmniPlanPrintingErrorHandlingStandard = 'lwst' /* Standard PostScript error handling */,
	OmniPlanPrintingErrorHandlingDetailed = 'lwdt' /* print a detailed report of PostScript errors */
} OmniPlanPrintingErrorHandling;

typedef enum {
	OmniPlanSchedulingGranularityExactScheduling = 'OPS0' /* Schedule tasks exactly down to the second. */,
	OmniPlanSchedulingGranularityHourlyScheduling = 'OPS1' /* All tasks start and end on hour boundaries. */,
	OmniPlanSchedulingGranularityDailyScheduling = 'OPS2' /* All tasks start at the beginning of a day and end at the end of a day. */
} OmniPlanSchedulingGranularity;

typedef enum {
	OmniPlanResourceTypePerson = 'OPRs' /* Resource person designation. */,
	OmniPlanResourceTypeEquipment = 'OPRe' /* Resource equipment designation. */,
	OmniPlanResourceTypeMaterial = 'OPRm' /* Resource material designation. */,
	OmniPlanResourceTypeResourceGroup = 'OPRg' /* Resource group designation. */
} OmniPlanResourceType;

typedef enum {
	OmniPlanTaskStatusOk = 'OPTo' /* None of the other statuses is true. */,
	OmniPlanTaskStatusCloseToDueDate = 'OPTc' /* Task is close to due date (status icon is green). */,
	OmniPlanTaskStatusDueNow = 'OPTd' /* Task is due today (status icon is orange). */,
	OmniPlanTaskStatusPastDue = 'OPTp' /* Task is past due (status icon is red). */,
	OmniPlanTaskStatusFinished = 'OPTm' /* Task is complete. */
} OmniPlanTaskStatus;

typedef enum {
	OmniPlanTaskTypeStandardTask = 'OPTS' /* A standard task. */,
	OmniPlanTaskTypeMilestoneTask = 'OPTM' /* A milestone. */,
	OmniPlanTaskTypeGroupTask = 'OPTG' /* A task which contains other tasks. */
} OmniPlanTaskType;

typedef enum {
	OmniPlanDependencyTypesStartstart = 'ODss' /* Start to start. */,
	OmniPlanDependencyTypesStartfinish = 'ODsf' /* Start to finish. */,
	OmniPlanDependencyTypesFinishstart = 'ODfs' /* Finish to start. */,
	OmniPlanDependencyTypesFinishfinish = 'ODff' /* Finish to finish. */
} OmniPlanDependencyTypes;



/*
 * Standard Suite
 */

// The application's top-level scripting object.
@interface OmniPlanApplication : SBApplication

- (SBElementArray *) documents;
- (SBElementArray *) windows;

@property (copy, readonly) NSString *name;  // The name of the application.
@property (readonly) BOOL frontmost;  // Is this the frontmost (active) application?
@property (copy, readonly) NSString *version;  // The version of the application.
@property (copy, readonly) NSArray *availableTemplates;  // Paths to available templates - see the document template property for more.
@property (copy, readonly) NSString *defaultTemplate;  // Path to default template - see the document template property for more.

- (SBObject *) open:(id)x;  // Open a document.
- (void) GetURL:(NSString *)x;  // Open a document from an URL.
- (void) print:(id)x withProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) quitSaving:(OmniPlanSaveOptions)saving;  // Quit the application.
- (BOOL) exists:(id)x;  // Verify if an object exists.
- (void) add:(id)x to:(SBObject *)to;  // Add the given object(s) to the container.
- (void) remove:(id)x from:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// An OmniPlan document.
@interface OmniPlanDocument : SBObject

- (NSString *) id;  // The document's unique identifier.
- (NSString *) template;  // This property can be set only as part of a make new document with properties command. It sets the initial state of the new document based on the template name provided.
- (void) setTemplate: (NSString *) template;

@property (copy, readonly) NSString *name;  // The document's name.
@property (readonly) BOOL modified;  // Has the document been modified since the last save?
@property (copy, readonly) NSURL *file;  // The document's location on disk.
@property (readonly) BOOL canUndo;  // Whether the document can undo the most recent command.
@property (readonly) BOOL canRedo;  // Whether the document can redo the most recently undone command.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// A window.
@interface OmniPlanWindow : SBObject

@property (copy) NSArray *selectedTasks;  // Current selected tasks in the window.
@property (copy) NSArray *selectedResources;  // Current selected resources in the window.
@property (copy) NSArray *taskColumns;  // Visible columns in the task view outline. May be: Violations, Status, Notes, Unique ID, Title, Time, Effort, Dependencies, Start, End, Priority, %Done, Assigned, Constraint Start, Constraint End, Cost, Resources Cost, Total Cost, Planned Start, Start Variance, Planned End, End Variance.
@property (copy) NSArray *resourceColumns;  // Visible columns in the resource view outline. May be: IM, Notes, Unique ID, Resource, #, Efficiency, Cost/Use, Cost/Hour, Total Cost, Total Hours, Total Uses, Type, Custom Work Week, Schedule Exception
@property (copy) NSArray *calendarColumns;  // Visible columns in the calendar view outline.
@property BOOL hasOverview;  // Whether the overview is visible.
@property (copy, readonly) NSString *name;  // The full title of the window.
- (NSInteger) id;  // The unique identifier of the window.
@property NSInteger index;  // The index of the window, ordered front to back.
@property NSRect bounds;  // The bounding rectangle of the window.
@property (readonly) BOOL closeable;  // Whether the window has a close box.
@property (readonly) BOOL minimizable;  // Whether the window can be minimized.
@property BOOL minimized;  // Whether the window is currently minimized.
@property (readonly) BOOL resizable;  // Whether the window can be resized.
@property BOOL visible;  // Whether the window is currently visible.
@property (readonly) BOOL zoomable;  // Whether the window can be zoomed.
@property BOOL zoomed;  // Whether the window is currently zoomed.
@property (copy, readonly) OmniPlanDocument *document;  // The document whose contents are being displayed in the window.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end



/*
 * Text Suite
 */

// Rich (styled) text
@interface OmniPlanRichText : SBObject

- (SBElementArray *) characters;
- (SBElementArray *) paragraphs;
- (SBElementArray *) words;
- (SBElementArray *) attributeRuns;

@property (copy) NSColor *color;  // The color of the first character.
@property (copy) NSString *font;  // The name of the font of the first character.
@property NSInteger size;  // The size in points of the first character.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// This subdivides the text into characters.
@interface OmniPlanCharacter : SBObject

- (SBElementArray *) characters;
- (SBElementArray *) paragraphs;
- (SBElementArray *) words;
- (SBElementArray *) attributeRuns;

@property (copy) NSColor *color;  // The color of the first character.
@property (copy) NSString *font;  // The name of the font of the first character.
@property NSInteger size;  // The size in points of the first character.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// This subdivides the text into paragraphs.
@interface OmniPlanParagraph : SBObject

- (SBElementArray *) characters;
- (SBElementArray *) paragraphs;
- (SBElementArray *) words;
- (SBElementArray *) attributeRuns;

@property (copy) NSColor *color;  // The color of the first character.
@property (copy) NSString *font;  // The name of the font of the first character.
@property NSInteger size;  // The size in points of the first character.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// This subdivides the text into words.
@interface OmniPlanWord : SBObject

- (SBElementArray *) characters;
- (SBElementArray *) paragraphs;
- (SBElementArray *) words;
- (SBElementArray *) attributeRuns;

@property (copy) NSColor *color;  // The color of the first character.
@property (copy) NSString *font;  // The name of the font of the first character.
@property NSInteger size;  // The size in points of the first character.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// This subdivides the text into chunks that all have the same attributes.
@interface OmniPlanAttributeRun : SBObject

- (SBElementArray *) characters;
- (SBElementArray *) paragraphs;
- (SBElementArray *) words;
- (SBElementArray *) attributeRuns;

@property (copy) NSColor *color;  // The color of the first character.
@property (copy) NSString *font;  // The name of the font of the first character.
@property NSInteger size;  // The size in points of the first character.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end



/*
 * OmniPlan suite
 */

// A project.
@interface OmniPlanProject : SBObject

- (SBElementArray *) namedStyles;
- (SBElementArray *) resources;
- (SBElementArray *) childResources;
- (SBElementArray *) tasks;
- (SBElementArray *) childTasks;
- (SBElementArray *) milestones;
- (SBElementArray *) violations;
- (SBElementArray *) attachments;
- (SBElementArray *) customDataEntries;

@property (copy) NSString *title;  // The title of the whole project.
@property (readonly) double totalCost;  // The cost of the entire project.
@property (readonly) double completed;  // The percentage of the project which is complete; 1.0 means 100%.
@property (readonly) double duration;  // The total duration of the project in seconds.
@property (readonly) double effort;  // The number of person-seconds required to complete the project.
@property (copy) NSDate *startingDate;  // The date on which work can begin.
@property (copy, readonly) NSDate *endingDate;  // The date on which work is complete.
@property BOOL undetermined;  // Is the start date for this project undetermined?
@property OmniPlanSchedulingGranularity schedulingGranularity;  // Scheduling granularity for this project.
@property (copy) id customData;  // Arbitrary data attached to this project.
@property (copy) NSString *note;  // Notes for this project.
@property (readonly) NSInteger violationCount;  // Number of violations in the current project.
@property (copy) NSColor *ganttBackgroundColor;  // Gantt view background color.
@property (copy) NSColor *ganttOffDayColor;  // Gantt view off day color.
@property (copy) NSColor *ganttTodayColor;  // Gantt view today color.
@property (copy) NSColor *ganttTaskDependencyLineColor;  // Gantt view task dependency line color.
@property (copy) NSColor *ganttResourceDependencyLineColor;  // Gantt view resource-based task dependency (dotted) line color.
@property (copy) NSColor *ganttCriticalPathColor;  // Gantt view critical path glow color.
@property (copy) NSColor *ganttDateScaleSeparatorColor;  // Gantt view scale separator line color.
@property (copy, readonly) OmniPlanSchedule *schedule;  // Schedule for this project.
@property (copy) OmniPlanCurrency *currency;  // Currency for this project.
@property (copy) OmniPlanStyle *baseStyle;  // Whole-document style of the project.
@property (copy) OmniPlanStyle *completedTaskStyle;  // Default style for completed tasks in the project.
@property (copy) OmniPlanStyle *columnTitleStyle;  // Style for column titles in the project.
@property (copy) OmniPlanStyle *noteStyle;  // Style for notes in the project.
@property (copy) OmniPlanStyle *standardTaskStyle;  // Default style for tasks in the project.
@property (copy) OmniPlanStyle *overdueTaskStyle;  // Default style for overdue, incomplete tasks in the project.
@property (copy) OmniPlanStyle *groupTaskStyle;  // Default style for groups in the project.
@property (copy) OmniPlanStyle *milestoneTaskStyle;  // Default style for milestones in the project.
@property (copy) OmniPlanStyle *resourceStyle;  // Default style for resources in the project.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// A resource.
@interface OmniPlanResource : SBObject

- (SBElementArray *) resources;
- (SBElementArray *) childResources;
- (SBElementArray *) assignments;
- (SBElementArray *) attachments;
- (SBElementArray *) customDataEntries;

- (NSInteger) id;  // Internal identifier for this resource.
@property (copy) NSString *name;  // The name of the resource.
@property (readonly) NSInteger outlineDepth;  // The depth or level of this task in the project heirarchy
@property double number;  // The total number of units for this resource. For Staff, 1.0 means 100%; for Materials, this is read-only.
@property OmniPlanResourceType resourceType;  // Type of the resource.
@property (copy) NSString *emailAddress;  // Email address for this resource.
@property (copy) NSString *addressId;  // Address book card id for this resource.
@property double costPerUse;  // The fixed cost per use of this resource.
@property double costPerHour;  // The cost per hour of this resource.
@property double efficiency;  // Resource efficiency; 1.0 means 100%.
@property (readonly) NSInteger totalUses;  // Total number of uses of this resource.
@property (readonly) double totalSeconds;  // Total seconds worked by this resource.
@property (readonly) double totalCost;  // Total cost of all assignments for this resource.
@property (copy) OmniPlanResource *group;  // Group this resource is in; resource id -1 is returned if at the top level.
@property (copy) id customData;  // Arbitrary data attached to this resource.
@property (copy) OmniPlanStyle *style;  // The style of this resource.
@property (copy, readonly) OmniPlanSchedule *schedule;  // Schedule for this resource.
@property (copy) NSString *note;  // Notes.
@property BOOL expanded;  // Whether a group is expanded in the outline.
@property BOOL noteExpanded;  // Whether the note is expanded and visible.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// A task (this includes milestones and task groups).
@interface OmniPlanTask : SBObject

- (SBElementArray *) tasks;
- (SBElementArray *) childTasks;
- (SBElementArray *) prerequisites;
- (SBElementArray *) dependents;
- (SBElementArray *) assignments;
- (SBElementArray *) attachments;
- (SBElementArray *) customDataEntries;

@property (copy) NSString *name;  // The name of the task.
@property (copy) NSDate *startingDate;  // The date on which work begins.
@property double duration;  // The number of working seconds occupied by task.
@property (copy) NSDate *endingDate;  // The date on which work ends. Note that if you set this to a date outside of working hours, it will be auto-corrected to the nearest working date before the date you set.
@property double completed;  // The percentage of the task which is complete; 1.0 means 100%.
@property double completedEffort;  // The person-seconds completed.
@property double remainingEffort;  // The person-seconds remaining.
@property NSInteger priority;  // Priority of this task.
@property (readonly) OmniPlanTaskStatus taskStatus;  // The status of the current task.
@property double effort;  // The number of person-seconds required to perform the task.
@property BOOL reservingTime;  // Whether this task group has reserve time or not.
@property double reserveTime;  // The number of extra work seconds reserved for this task group.
@property OmniPlanTaskType taskType;  // Whether this task is a standard task, milestone, or group.
@property BOOL recalculatesDuration;  // When assignments change, whether the task's duration changes.
@property BOOL recalculatesEffort;  // When assignments change, whether the task's effort changes.
@property (readonly) BOOL critical;  // Whether this task is on the critical path or not.
@property double staticCost;  // Cost for this task itself.
@property (readonly) double resourceCost;  // Cost for paying resources assigned to this task.
@property (readonly) double totalCost;  // Total cost for this task, static cost + resource cost, or total of all child task costs.
@property (copy) id customData;  // Arbitrary data attached to this task.
@property (copy) OmniPlanStyle *style;  // The style of this task.
- (NSInteger) id;  // Internal identifier for this task.
@property (copy, readonly) OmniPlanTask *parentTask;  // The group that this task is in.
@property (readonly) NSInteger outlineDepth;  // The depth or level of this task in the project heirarchy
@property (copy, readonly) NSString *outlineNumber;  // The heirarchical or WBS number of this task
@property (copy) NSDate *startingBaselineDate;  // The original starting date for this task.
@property (copy) NSDate *endingBaselineDate;  // The original ending date for this task.
@property (readonly) double startingBaselineVariance;  // The difference between the actual start and the baseline start.
@property (readonly) double endingBaselineVariance;  // The difference between the actual end and the baseline end.
@property (copy) NSDate *startingConstraintDate;  // The earliest date this task may start.
@property (copy) NSDate *endingConstraintDate;  // The latest date this task may end.
@property BOOL startingDateLocked;  // Whether the start date is locked or not.
@property BOOL endingDateLocked;  // Whether the end date is locked or not.
@property (copy) NSString *note;  // Notes.
@property BOOL expanded;  // Whether a group is expanded in the outline.
@property BOOL noteExpanded;  // Whether the note is expanded and visible.
@property BOOL filtered;  // Whether a task has been filtered out of the visible display or not.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// A milestone.
@interface OmniPlanMilestone : OmniPlanTask


@end

// A child of a task group; this gets only the immediate children of the group. To get all descendants regardless of level, use 'tasks' instead of 'child tasks'.
@interface OmniPlanChildTask : OmniPlanTask


@end

// A child of a resource group.
@interface OmniPlanChildResource : OmniPlanResource


@end

// An assignment of a resource to a task.
@interface OmniPlanAssignment : SBObject

@property (copy, readonly) OmniPlanResource *resource;  // Resource that is assigned.
@property double units;  // Units of the resource required for this task. For Staff resources, 1.0 means 100%.
@property (copy, readonly) OmniPlanTask *task;  // Task that the resource is assigned to.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// A dependency of one task upon another task.
@interface OmniPlanDependency : SBObject

@property (copy, readonly) OmniPlanTask *prerequisiteTask;  // Prerequisite task for this dependency.
@property (copy, readonly) OmniPlanTask *dependentTask;  // Dependent task for this dependency.
@property OmniPlanDependencyTypes dependencyType;  // Type of dependency.
@property double leadTime;  // The number of seconds of lead time required between the tasks involved in the dependency.
@property double leadPercentage;  // The lead time, in percentage of the length of the prerequisite, required for the dependency.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// A dependency starting at another task and ending at this task.
@interface OmniPlanPrerequisite : OmniPlanDependency


@end

// A dependency starting at this task and ending at another task.
@interface OmniPlanDependent : OmniPlanDependency


@end

// A violation in the project.
@interface OmniPlanViolation : SBObject

@property (copy, readonly) NSString *violationType;  // The type of violation.
@property (copy, readonly) NSString *shortDescription;  // The short description of this violation.
@property (copy, readonly) NSString *html;  // The long description HTML for this violation.
@property (copy, readonly) NSArray *actions;  // Automatic action names that can be performed.
@property (copy, readonly) OmniPlanTask *task;  // The task related to this violation.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// A locale based currency object for the project.
@interface OmniPlanCurrency : SBObject

@property (copy, readonly) NSString *code;  // Locale code for this currency.
@property (copy, readonly) NSString *name;  // Name for this currency.
@property (copy, readonly) NSString *symbol;  // Symbol for this currency.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// The regular working hours for a day of the week.
@interface OmniPlanWeekDaySchedule : SBObject

@property double duration;  // Total number of work-seconds in this day.
@property (copy, readonly) NSString *startTime;  // Start time of this day.
@property (copy, readonly) NSString *endTime;  // End time of this day.
@property (copy, readonly) NSArray *workTimes;  // Working time spans during this day.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// The working hours for a specific calendar day which does not match the regular schedule for that day of the week.
@interface OmniPlanCalendarDaySchedule : OmniPlanWeekDaySchedule

@property (copy, readonly) NSDate *specificDate;  // Date where these working hours apply.


@end

// A schedule of working time for a project or resource.
@interface OmniPlanSchedule : SBObject

- (SBElementArray *) weekDaySchedules;
- (SBElementArray *) calendarDaySchedules;

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// A file attached to a project, task, or resource.
@interface OmniPlanAttachment : SBObject

@property (copy, readonly) NSURL *file;  // Location of the attachment on disk.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// A key-value pair attached to a project, task, or resource.
@interface OmniPlanCustomDataEntry : SBObject

@property (copy, readonly) NSString *name;  // Key name.
@property (copy) NSString *value;  // Value string.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end



/*
 * OmniStyle Scripting
 */

// A style object.
@interface OmniPlanStyle : SBObject

- (SBElementArray *) namedStyles;
- (SBElementArray *) attributes;

@property (copy, readonly) SBObject *container;  // The object owning the style.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// An attribute of a style.
@interface OmniPlanAttribute : SBObject

@property (copy, readonly) NSString *name;  // The name of the attribute.
@property (copy) OmniPlanStyle *style;  // The style to which the attribute refers.
@property (copy, readonly) OmniPlanStyle *definingStyle;  // The style responsible for the effective value in this attributes's style.  This processes the local values, inherited styles and cascade chain.
@property (copy) id value;  // The value of the attribute in its style.
@property (copy) id defaultValue;  // The default value of the attribute in its style.

- (void) closeSaving:(OmniPlanSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (SBObject *) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (SBObject *) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) exportTo:(NSURL *)to as:(NSString *)as usingTemplate:(id)usingTemplate withProperties:(NSDictionary *)withProperties;  // Export a document.
- (void) assignTo:(SBObject *)to units:(double)units;  // Assign resources to tasks.
- (OmniPlanDependency *) dependUpon:(SBObject *)upon;  // Create a dependency between tasks.
- (void) baseline;  // Commit the current schedule as the baseline schedule.
- (void) level;  // Level resources on project.
- (OmniPlanTask *) lookupValue:(NSString *)value in:(NSString *)in_;  // Look up a task via a custom data key.
- (id) addWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Add working hours to a schedule.
- (id) subtractWorkTimeFrom:(NSString *)from to:(NSString *)to on:(NSDate *)on weekday:(NSInteger)weekday;  // Remove working hours from a schedule.
- (void) fixWithAction:(NSString *)withAction;  // Fix a violation.
- (void) undo;  // Undo the last command.
- (void) redo;  // Redo the last undone command.
- (void) addTo:(SBObject *)to;  // Add the given object(s) to the container.
- (void) removeFrom:(SBObject *)from;  // Remove the given object(s) from the container.

@end

// A named style object.
@interface OmniPlanNamedStyle : OmniPlanStyle

- (NSString *) id;  // An identifier for the named style that is unique within its document.  Currently this identifier is not persistent between two different sessions of editing the document.
@property (copy) NSString *name;  // The name of the style.  Must be unique within the containing document.


@end


/*
 * OPCommandGlue.h
 * /Applications/OmniPlan.app
 * osaglue 0.5.2
 *
 */

#import <Foundation/Foundation.h>
#import "Appscript/Appscript.h"
#import "OPReferenceRendererGlue.h"

@interface OPCommand : ASCommand
- (NSString *)AS_formatObject:(id)obj appData:(id)appData;
@end


@interface OPGetURLCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPActivateCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPAddCommand : OPCommand
- (OPAddCommand *)to:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPAddWorkTimeCommand : OPCommand
- (OPAddWorkTimeCommand *)from:(id)value;
- (OPAddWorkTimeCommand *)on:(id)value;
- (OPAddWorkTimeCommand *)to:(id)value;
- (OPAddWorkTimeCommand *)weekday:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPAssignCommand : OPCommand
- (OPAssignCommand *)to:(id)value;
- (OPAssignCommand *)units:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPBaselineCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPCloseCommand : OPCommand
- (OPCloseCommand *)saving:(id)value;
- (OPCloseCommand *)savingIn:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPCountCommand : OPCommand
- (OPCountCommand *)each:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPDeleteCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPDependCommand : OPCommand
- (OPDependCommand *)upon:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPDuplicateCommand : OPCommand
- (OPDuplicateCommand *)to:(id)value;
- (OPDuplicateCommand *)withProperties:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPExistsCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPExportCommand : OPCommand
- (OPExportCommand *)as:(id)value;
- (OPExportCommand *)to:(id)value;
- (OPExportCommand *)usingTemplate:(id)value;
- (OPExportCommand *)withProperties:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPFixCommand : OPCommand
- (OPFixCommand *)withAction:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPGetCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPLaunchCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPLevelCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPLookupCommand : OPCommand
- (OPLookupCommand *)in:(id)value;
- (OPLookupCommand *)value:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPMakeCommand : OPCommand
- (OPMakeCommand *)at:(id)value;
- (OPMakeCommand *)new_:(id)value;
- (OPMakeCommand *)withData:(id)value;
- (OPMakeCommand *)withProperties:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPMoveCommand : OPCommand
- (OPMoveCommand *)to:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPOpenCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPOpenLocationCommand : OPCommand
- (OPOpenLocationCommand *)window:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPOpen_Command : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPPrintCommand : OPCommand
- (OPPrintCommand *)printDialog:(id)value;
- (OPPrintCommand *)withProperties:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPQuitCommand : OPCommand
- (OPQuitCommand *)saving:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPRedoCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPRemoveCommand : OPCommand
- (OPRemoveCommand *)from:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPReopenCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPRunCommand : OPCommand
- (NSString *)AS_commandName;
@end


@interface OPSaveCommand : OPCommand
- (OPSaveCommand *)in:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPSetCommand : OPCommand
- (OPSetCommand *)to:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPSubtractWorkTimeCommand : OPCommand
- (OPSubtractWorkTimeCommand *)from:(id)value;
- (OPSubtractWorkTimeCommand *)on:(id)value;
- (OPSubtractWorkTimeCommand *)to:(id)value;
- (OPSubtractWorkTimeCommand *)weekday:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface OPUndoCommand : OPCommand
- (NSString *)AS_commandName;
@end


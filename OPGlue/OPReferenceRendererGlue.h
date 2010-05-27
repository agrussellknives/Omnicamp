/*
 * OPReferenceRendererGlue.h
 * /Applications/OmniPlan.app
 * osaglue 0.5.2
 *
 */

#import <Foundation/Foundation.h>
#import "Appscript/Appscript.h"

@interface OPReferenceRenderer : ASReferenceRenderer
- (NSString *)propertyByCode:(OSType)code;
- (NSString *)elementByCode:(OSType)code;
- (NSString *)prefix;
@end


/*
 * OPCommandGlue.m
 * /Applications/OmniPlan.app
 * osaglue 0.5.2
 *
 */

#import "OPCommandGlue.h"

@implementation OPCommand
- (NSString *)AS_formatObject:(id)obj appData:(id)appData {
    return [OPReferenceRenderer formatObject: obj appData: appData];
}

@end


@implementation OPGetURLCommand
- (NSString *)AS_commandName {
    return @"GetURL";
}

@end


@implementation OPActivateCommand
- (NSString *)AS_commandName {
    return @"activate";
}

@end


@implementation OPAddCommand
- (OPAddCommand *)to:(id)value {
    [AS_event setParameter: value forKeyword: 'to  '];
    return self;

}

- (NSString *)AS_commandName {
    return @"add";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'to  ':
            return @"to";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPAddWorkTimeCommand
- (OPAddWorkTimeCommand *)from:(id)value {
    [AS_event setParameter: value forKeyword: 'OPfm'];
    return self;

}

- (OPAddWorkTimeCommand *)on:(id)value {
    [AS_event setParameter: value forKeyword: 'OPon'];
    return self;

}

- (OPAddWorkTimeCommand *)to:(id)value {
    [AS_event setParameter: value forKeyword: 'insh'];
    return self;

}

- (OPAddWorkTimeCommand *)weekday:(id)value {
    [AS_event setParameter: value forKeyword: 'OPwd'];
    return self;

}

- (NSString *)AS_commandName {
    return @"addWorkTime";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'OPfm':
            return @"from";
        case 'OPon':
            return @"on";
        case 'insh':
            return @"to";
        case 'OPwd':
            return @"weekday";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPAssignCommand
- (OPAssignCommand *)to:(id)value {
    [AS_event setParameter: value forKeyword: 'insh'];
    return self;

}

- (OPAssignCommand *)units:(id)value {
    [AS_event setParameter: value forKeyword: 'Oaan'];
    return self;

}

- (NSString *)AS_commandName {
    return @"assign";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'insh':
            return @"to";
        case 'Oaan':
            return @"units";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPBaselineCommand
- (NSString *)AS_commandName {
    return @"baseline";
}

@end


@implementation OPCloseCommand
- (OPCloseCommand *)saving:(id)value {
    [AS_event setParameter: value forKeyword: 'savo'];
    return self;

}

- (OPCloseCommand *)savingIn:(id)value {
    [AS_event setParameter: value forKeyword: 'kfil'];
    return self;

}

- (NSString *)AS_commandName {
    return @"close";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'savo':
            return @"saving";
        case 'kfil':
            return @"savingIn";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPCountCommand
- (OPCountCommand *)each:(id)value {
    [AS_event setParameter: value forKeyword: 'kocl'];
    return self;

}

- (NSString *)AS_commandName {
    return @"count";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'kocl':
            return @"each";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPDeleteCommand
- (NSString *)AS_commandName {
    return @"delete";
}

@end


@implementation OPDependCommand
- (OPDependCommand *)upon:(id)value {
    [AS_event setParameter: value forKeyword: 'OPup'];
    return self;

}

- (NSString *)AS_commandName {
    return @"depend";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'OPup':
            return @"upon";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPDuplicateCommand
- (OPDuplicateCommand *)to:(id)value {
    [AS_event setParameter: value forKeyword: 'insh'];
    return self;

}

- (OPDuplicateCommand *)withProperties:(id)value {
    [AS_event setParameter: value forKeyword: 'prdt'];
    return self;

}

- (NSString *)AS_commandName {
    return @"duplicate";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'insh':
            return @"to";
        case 'prdt':
            return @"withProperties";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPExistsCommand
- (NSString *)AS_commandName {
    return @"exists";
}

@end


@implementation OPExportCommand
- (OPExportCommand *)as:(id)value {
    [AS_event setParameter: value forKeyword: 'fltp'];
    return self;

}

- (OPExportCommand *)to:(id)value {
    [AS_event setParameter: value forKeyword: 'kfil'];
    return self;

}

- (OPExportCommand *)usingTemplate:(id)value {
    [AS_event setParameter: value forKeyword: 'OPet'];
    return self;

}

- (OPExportCommand *)withProperties:(id)value {
    [AS_event setParameter: value forKeyword: 'opes'];
    return self;

}

- (NSString *)AS_commandName {
    return @"export";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'fltp':
            return @"as";
        case 'kfil':
            return @"to";
        case 'OPet':
            return @"usingTemplate";
        case 'opes':
            return @"withProperties";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPFixCommand
- (OPFixCommand *)withAction:(id)value {
    [AS_event setParameter: value forKeyword: 'OPAc'];
    return self;

}

- (NSString *)AS_commandName {
    return @"fix";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'OPAc':
            return @"withAction";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPGetCommand
- (NSString *)AS_commandName {
    return @"get";
}

@end


@implementation OPLaunchCommand
- (NSString *)AS_commandName {
    return @"launch";
}

@end


@implementation OPLevelCommand
- (NSString *)AS_commandName {
    return @"level";
}

@end


@implementation OPLookupCommand
- (OPLookupCommand *)in:(id)value {
    [AS_event setParameter: value forKeyword: 'kfil'];
    return self;

}

- (OPLookupCommand *)value:(id)value {
    [AS_event setParameter: value forKeyword: 'OPvl'];
    return self;

}

- (NSString *)AS_commandName {
    return @"lookup";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'kfil':
            return @"in";
        case 'OPvl':
            return @"value";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPMakeCommand
- (OPMakeCommand *)at:(id)value {
    [AS_event setParameter: value forKeyword: 'insh'];
    return self;

}

- (OPMakeCommand *)new_:(id)value {
    [AS_event setParameter: value forKeyword: 'kocl'];
    return self;

}

- (OPMakeCommand *)withData:(id)value {
    [AS_event setParameter: value forKeyword: 'data'];
    return self;

}

- (OPMakeCommand *)withProperties:(id)value {
    [AS_event setParameter: value forKeyword: 'prdt'];
    return self;

}

- (NSString *)AS_commandName {
    return @"make";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'insh':
            return @"at";
        case 'kocl':
            return @"new_";
        case 'data':
            return @"withData";
        case 'prdt':
            return @"withProperties";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPMoveCommand
- (OPMoveCommand *)to:(id)value {
    [AS_event setParameter: value forKeyword: 'insh'];
    return self;

}

- (NSString *)AS_commandName {
    return @"move";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'insh':
            return @"to";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPOpenCommand
- (NSString *)AS_commandName {
    return @"open";
}

@end


@implementation OPOpenLocationCommand
- (OPOpenLocationCommand *)window:(id)value {
    [AS_event setParameter: value forKeyword: 'WIND'];
    return self;

}

- (NSString *)AS_commandName {
    return @"openLocation";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'WIND':
            return @"window";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPOpen_Command
- (NSString *)AS_commandName {
    return @"open_";
}

@end


@implementation OPPrintCommand
- (OPPrintCommand *)printDialog:(id)value {
    [AS_event setParameter: value forKeyword: 'pdlg'];
    return self;

}

- (OPPrintCommand *)withProperties:(id)value {
    [AS_event setParameter: value forKeyword: 'prdt'];
    return self;

}

- (NSString *)AS_commandName {
    return @"print";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'pdlg':
            return @"printDialog";
        case 'prdt':
            return @"withProperties";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPQuitCommand
- (OPQuitCommand *)saving:(id)value {
    [AS_event setParameter: value forKeyword: 'savo'];
    return self;

}

- (NSString *)AS_commandName {
    return @"quit";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'savo':
            return @"saving";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPRedoCommand
- (NSString *)AS_commandName {
    return @"redo";
}

@end


@implementation OPRemoveCommand
- (OPRemoveCommand *)from:(id)value {
    [AS_event setParameter: value forKeyword: 'from'];
    return self;

}

- (NSString *)AS_commandName {
    return @"remove";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'from':
            return @"from";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPReopenCommand
- (NSString *)AS_commandName {
    return @"reopen";
}

@end


@implementation OPRunCommand
- (NSString *)AS_commandName {
    return @"run";
}

@end


@implementation OPSaveCommand
- (OPSaveCommand *)in:(id)value {
    [AS_event setParameter: value forKeyword: 'kfil'];
    return self;

}

- (NSString *)AS_commandName {
    return @"save";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'kfil':
            return @"in";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPSetCommand
- (OPSetCommand *)to:(id)value {
    [AS_event setParameter: value forKeyword: 'data'];
    return self;

}

- (NSString *)AS_commandName {
    return @"set";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'data':
            return @"to";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPSubtractWorkTimeCommand
- (OPSubtractWorkTimeCommand *)from:(id)value {
    [AS_event setParameter: value forKeyword: 'OPfm'];
    return self;

}

- (OPSubtractWorkTimeCommand *)on:(id)value {
    [AS_event setParameter: value forKeyword: 'OPon'];
    return self;

}

- (OPSubtractWorkTimeCommand *)to:(id)value {
    [AS_event setParameter: value forKeyword: 'insh'];
    return self;

}

- (OPSubtractWorkTimeCommand *)weekday:(id)value {
    [AS_event setParameter: value forKeyword: 'OPwd'];
    return self;

}

- (NSString *)AS_commandName {
    return @"subtractWorkTime";
}

- (NSString *)AS_parameterNameForCode:(DescType)code {
    switch (code) {
        case 'OPfm':
            return @"from";
        case 'OPon':
            return @"on";
        case 'insh':
            return @"to";
        case 'OPwd':
            return @"weekday";
    }
    return [super AS_parameterNameForCode: code];
}

@end


@implementation OPUndoCommand
- (NSString *)AS_commandName {
    return @"undo";
}

@end


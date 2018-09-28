//
//  IgnorePattern.swift
//
//  Created by ToKoRo on 2018-09-28.
//

import Foundation

enum IgnorePattern: String, CaseIterable {
    case noSuchModule = " no such module "
    case hasNoMember = " has no member "
    case undeclaredType = " undeclared type "
    case unresolvedIdentifier = " unresolved identifier "
    case cannotBeReferenced = " cannot be referenced "
    case doesNotOverride = " does not override "
    case doesNotConform = " does not conform "
    case doNotMatch = " do not match "
    case requiresFunction = " requires function "
    case protoclRequiresProperty = " protocol requires property "
    case didYouMean = " did you mean "
    case partiallyMatchingParameter = " partially matching parameter "
    case extraneusArgumentLabel = " extraneous argument label "
    case cannotInvoke = " cannot invoke "
    case declaredHere = " declared here$"
    case notTheExpected = " not the expected "
    case takesNoArguments = " takes no arguments$"
    case nonMatchingType = " non-matching type "
    case typeOfExpressionIsAmbigous = " type of expression is ambiguous "
    case onlyClassesThatInherit = " only classes that inherit "
    case unableToInfer = " unable to infer "
    case notAMemberType = " not a member type "
    case mustNotBeApplied = " must not be applied "
    case myBeMarkedWith = " may be marked with "
    case cannotUseModule = " cannot use module "
    case cannotBeApplied = " cannot be applied "
    case requiresACotextualType = " requires a contextual type$"
    case cannotConvertValue = " cannot convert value "
    case cannotMatchValues = " cannot match values "
    case cannotBeConstructed = " cannot be constructed "
    case requiresInitializer = " requires initializer "
    case cannotLoad = " cannot load "
    case expectedDeclaration = " expected declaration$"
    case inDeclarationOf = " in declaration of "
    case mustHave = " must have "

    /* optionals
    case wasDeprecated = " was deprecated "
    case propertiesAreImplicitly = " properties are implicitly "
    case platformConditionAppears = " platform condition appears "
    case circularDependency = " circular dependency "
    case wasObsoleted = " was obsoleted "
    case hasBeenRenamed = " has been renamed "
    case isUnreachable = " is unreachable "
    case expectedAnArgument = " expected an argument "
    */
}

// Mocks generated by Mockito 5.4.0 from annotations
// in domain/test/pokemon_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:domain/domain.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePokemonList_0 extends _i1.SmartFake implements _i2.PokemonList {
  _FakePokemonList_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePokemonDetails_1 extends _i1.SmartFake
    implements _i2.PokemonDetails {
  _FakePokemonDetails_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PokemonRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonRepository extends _i1.Mock implements _i2.PokemonRepository {
  MockPokemonRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i2.PokemonList> getPokemonList(String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonList,
          [url],
        ),
        returnValue: _i3.Future<_i2.PokemonList>.value(_FakePokemonList_0(
          this,
          Invocation.method(
            #getPokemonList,
            [url],
          ),
        )),
      ) as _i3.Future<_i2.PokemonList>);
  @override
  _i3.Future<_i2.PokemonDetails> getPokemonDetails(String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonDetails,
          [url],
        ),
        returnValue: _i3.Future<_i2.PokemonDetails>.value(_FakePokemonDetails_1(
          this,
          Invocation.method(
            #getPokemonDetails,
            [url],
          ),
        )),
      ) as _i3.Future<_i2.PokemonDetails>);
}

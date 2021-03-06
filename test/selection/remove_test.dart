import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';
import 'package:d3/selection/selection.dart';

main() {
  useHtmlEnhancedConfiguration();

  group('select(body)', () {
    test('removes the matching elements', () {
      var div = new Selection.selector('body').append('div');
      div.remove();
      expect(div[0][0].parentNode, /*dom*/isNull);
    });
    test('does not remove non-matching elements', () {
      var body = new Selection.selector('body'),
          div1 = body.append('div'),
          div2 = body.append('div');
      div1.remove();
      expect(div2[0][0].parentNode, /*dom*/equals(body.node));
    });
    /*test('ignores null nodes', () {
      var div1 = select('body').append('div');
      var div2 = div1.selectAll('div').data([0, 1]).enter().append('div');
      var node = div2[0][0];
      div2[0][0] = null;
      div2.remove();
      expect(node.parentNode, /*dom*/equals(div1.node()));
      expect(div2[0][1].parentNode, /*dom*/isNull);
    });*/
    test('returns the current selection', () {
      var div = new Selection.selector('body').append('div');
      expect(div..remove(), same(div));
    });
  });
}

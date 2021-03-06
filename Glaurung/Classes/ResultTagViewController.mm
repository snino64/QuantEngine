/*
  Glaurung, a chess program for the Apple iPhone.
  Copyright (C) 2004-2010 Tord Romstad, Marco Costalba, Joona Kiiski.

  Glaurung is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  Glaurung is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#import "Game.h"
#import "GameDetailsTableController.h"
#import "ResultTagViewController.h"


@implementation ResultTagViewController

- (id)initWithGameDetailsController:(GameDetailsTableController *)gdtc {
  if (self = [super init]) {
    gameDetailsController = gdtc;
    contents = [[NSArray arrayWithObjects:
                           @"1-0", @"0-1", @"1/2-1/2", @"*", nil]
                 retain];
  }
  return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSInteger row = [indexPath row];

  UITableViewCell *cell =
    [[self tableView] dequeueReusableCellWithIdentifier: @"any-cell"];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithFrame: CGRectZero
                                   reuseIdentifier: @"any-cell"]
             autorelease];
  }
  [[cell textLabel] setText: [contents objectAtIndex: row]];
  if ([[[cell textLabel] text] isEqualToString: [[gameDetailsController game] result]]) {
    [cell setAccessoryType: UITableViewCellAccessoryCheckmark];
    checkedRow = row;
  }
  else
    [cell setAccessoryType: UITableViewCellAccessoryNone];
  return cell;
}


- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath:
  (NSIndexPath *)newIndexPath {
  NSInteger row = [newIndexPath row];

  [self performSelector: @selector(deselect:) withObject: tableView
             afterDelay: 0.1f];
  if (row != checkedRow) {
    [[gameDetailsController game]
      setResult: [[[tableView cellForRowAtIndexPath: newIndexPath] textLabel] text]];
    [tableView reloadData];
    [gameDetailsController updateTableCells];
  }
}


- (void)deselect:(UITableView *)tableView {
  [tableView deselectRowAtIndexPath: [tableView indexPathForSelectedRow]
                           animated: YES];
}


- (void)dealloc {
  [contents release];
  [super dealloc];
}


@end


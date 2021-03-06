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

#import <UIKit/UIKit.h>

@class BoardViewController;
@class Game;

@interface GameDetailsTableController : UITableViewController {
  BoardViewController *boardViewController;
  Game *game;
  BOOL email;
}

@property (nonatomic, readonly) Game *game;

- (id)initWithBoardViewController:(BoardViewController *)bvc
                             game:(Game *)aGame
                            email:(BOOL)mail;
- (void)deselect:(UITableView *)tableView;
- (void)updateTableCells;
- (void)emailMenuDonePressed;
- (void)saveMenuDonePressed;

@end

#-------------------------------------------------------------------------
#
# Makefile for parser
#
# src/backend/parser/Makefile
#
#-------------------------------------------------------------------------

subdir = src/backend/parser
top_builddir = ../../..
include $(top_builddir)/src/Makefile.global

override CPPFLAGS := -I. -I$(srcdir) $(CPPFLAGS)

OBJS= analyze.o gram.o scan.o keywords.o kwlookup.o parser.o \
      parse_agg.o parse_clause.o parse_coerce.o parse_collate.o parse_cte.o \
      parse_expr.o parse_func.o parse_node.o parse_oper.o parse_param.o \
      parse_relation.o parse_target.o parse_type.o parse_utilcmd.o scansup.o

FLEXFLAGS = -CF -b -p -p

include $(top_srcdir)/src/backend/common.mk




# Latest flex causes warnings in this file.
ifeq ($(GCC),yes)
scan.o: CFLAGS += -Wno-error
endif


# There is no correct way to write a rule that generates two files.
# Rules with two targets don't have that meaning, they are merely
# shorthand for two otherwise separate rules.  To be safe for parallel
# make, we must chain the dependencies like this.  The semicolon is
# important, otherwise make will choose the built-in rule for
# gram.y=>gram.c.

gram.h: gram.c ;

gram.c: gram.y
ifdef BISON
	$(BISON) -d $(BISONFLAGS) -o $@ $<
else
	@$(missing) bison $< $@
endif


scan.c: scan.l
ifdef FLEX
	$(FLEX) $(FLEXFLAGS) -o'$@' $<
	@if [ `wc -l <lex.backup` -eq 1 ]; then rm lex.backup; else echo "Scanner requires backup, see lex.backup."; exit 1; fi
else
	@$(missing) flex $< $@
endif


# Force these dependencies to be known even without dependency info built:
gram.o scan.o keywords.o parser.o: gram.h


# gram.c, gram.h, and scan.c are in the distribution tarball, so they
# are not cleaned here.
clean distclean maintainer-clean:
	rm -f lex.backup


maintainer-check:
	$(PERL) $(top_srcdir)/src/tools/check_keywords.pl $(top_srcdir)
